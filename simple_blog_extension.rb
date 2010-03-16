# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SimpleBlogExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/simple_blog"

  # Please use simple_blog/config/routes.rb instead for extension routes.

  def self.require_gems(config)
    config.gem "rdiscount", :version => '1.5.5'
  end
  
  def activate

    Spree::BaseController.class_eval do
      helper ArticlesHelper
    end

    AppConfiguration.class_eval do
      preference :disqus_id, :default => nil
      preference :blog_feed_url, :default => '/blog.xml'
    end

  end
end
