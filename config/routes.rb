Rails.application.routes.draw do

  match '/blog',                              :to => 'articles#index',   :as => 'blog_articles'
  match '/blog.:format',                      :to => 'articles#index',   :as => 'blog_articles'
  match '/blog/tag/:tag',                     :to => 'articles#tag',     :as => 'blog_tag'
  match '/blog/page/:page',                   :to => 'articles#index',   :as => 'blog_articles_page'
  match '/blog/:year/:month',                 :to => 'articles#archive', :as => 'blog_articles_archive'
  match '/blog/:year/:month/:day/:permalink', :to => 'articles#show',    :as => 'blog_article'

end
