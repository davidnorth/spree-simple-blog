class SimpleBlogConfiguration  < Spree::Preferences::Configuration

  preference :disqus_id, :string, :default => ''
  preference :blog_feed_url, :string, :default => '/blog.xml'

end

