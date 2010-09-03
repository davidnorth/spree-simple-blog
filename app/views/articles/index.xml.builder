xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title Spree::Config[:blog_feed_title]
  xml.id Spree::Config[:blog_feed_url]
  xml.updated @articles.first.date.xmlschema unless @articles.empty?
  xml.author { xml.name Spree::Config[:blog_feed_author] }

  @articles.each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article_url(article)
      xml.id article_url(article)
      xml.published article.date.xmlschema
      xml.updated article.date.xmlschema
      xml.author { xml.name article.author }
      xml.content("type" => "html") { xml.cdata!(html_transform(article.body)) }
    end
  end
end

