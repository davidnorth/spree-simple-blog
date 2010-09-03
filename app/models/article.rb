class Article < FileModel
  
  def self.find_articles(options = {})
    options = {
      :per_page => 10,
      :page => 1
    }.merge(options)
    
    options[:offset] = (options[:page]-1) * options[:per_page]
    options[:limit] = options[:per_page]

    if options[:year] and options[:month]
      options[:match] = %r(\/#{options[:year]}-#{options[:month].to_s.rjust(2,'0')})
    end

    all(options)
  end

  def self.recent(number = 5)
    @@recent ||= all(:limit => number)
  end

  def self.tagged(tag) 
    tag_index[tag.strip].to_a.map do |key|
      Article.find(key)
    end
  end

  def self.archive_months
    @@archive_months ||= files.map{|f| File.basename(f).split('-')[0..1] }.uniq
  end

  # Store list of articles for each tag in a hash
  # Fast enough for the small number of articles we're dealing with
  @@tag_index = {}
  def self.tag_index
    return @@tag_index if @@tag_index.present?
    all.each do |a| 
     a.tags.split(',').map(&:strip).each do |t| 
       @@tag_index[t] ||= []
       @@tag_index[t] = (@@tag_index[t] << a.key).uniq
      end
    end
    @@tag_index
  end
  
  %w(title_tag meta_keywords meta_description).each do |attribute|
    define_method(attribute) do
      meta[attribute]
    end
  end

end