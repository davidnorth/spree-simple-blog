map.with_options({:controller => "articles"}) do |m|
  m.blog_articles '/blog', :action => 'index'
  m.blog_articles '/blog.:format', :action => 'index'
  m.blog_tag '/blog/tag/:tag', :action => 'tag'
  m.blog_articles_page '/blog/page/:page', :action => 'index'
  m.blog_articles_archive '/blog/:year/:month', :action => 'archive'
  m.blog_article '/blog/:year/:month/:day/:permalink', :action => 'show'
end
