class SimpleBlogConfiguration  < Spree::Preferences::Configuration

  preference :disqus_id, :default => nil
  preference :blog_feed_url, :default => '/blog.xml'

end

