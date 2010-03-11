# Base class for simple models that load their content from text files formatted like Toto's articles
class FileModel
  attr_accessor :file, :key, :meta, :body
  
  def initialize(file, key, meta, body)
    @file = file
    @key = key
    @meta = meta
    @body = body  
  end

  def method_missing(method, *args)
    if meta.has_key?(method.to_s)
      meta[method.to_s]
    else
      super
    end
  end


  def self.all(options = {})
    options = {
      :offset => 0
    }.merge(options)

    files = get_filtered_files(options)

    if options[:limit]
      files = files[options[:offset] .. (options[:offset].to_i + options[:limit].to_i-1)]
    end

    records = files.to_a.map do |f|
      from_file(f)
    end

    records
  end

  def self.find(key)
    from_file("#{content_path}/#{key}.txt")
  end
  
  def self.count(options = {})
    get_filtered_files(options).length
  end
  
  def self.random(options = {})
    files = content_dir.to_a
    from_file(files[rand(all.size)])
  end

  def self.content_dir
    Dir["#{content_path}/*.txt"]
  end

  def index
    @index ||= Article.content_dir.to_a.index(file)
  end

  def next
    return @next if @next.present?
    if next_file = self.class.content_dir.to_a[index + 1]
      @next = self.class.from_file(next_file)
    end
  end

  def previous
    return @previous if @previous.present?
    if index > 0 and previous_file = self.class.content_dir.to_a[index - 1]
      @previous = self.class.from_file(previous_file)
    end
  end



  def self.from_file(file)
    meta, body = File.read(file).split(/\n\n/, 2)
    meta = YAML.load(meta)
    key = File.basename(file).gsub('.txt','')
    new(file, key, meta, body)
  end

  def self.content_path
    File.expand_path(File.join(RAILS_ROOT, "content",  self.name.underscore.pluralize))
  end
  
  private
  
    def self.get_filtered_files(options)
      files = content_dir.to_a.reverse
      if options[:match]
        files = files.select{|f| f =~ options[:match]}
      end
      files
    end
    
end