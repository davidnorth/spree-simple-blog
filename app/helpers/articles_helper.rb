require 'rdiscount'

module ArticlesHelper
  
  def html_transform(text)
    RDiscount.new(text.to_s).to_html.html_safe
  end

  def format_date(time)
    time.strftime("%B %d %Y")
  end

  def format_time(time)
    time.strftime("%I:%m%p")
  end

  def link_to_archive(archive_month)
    text = "#{Date::MONTHNAMES[archive_month.last.to_i]} #{archive_month.first.to_i}"
    link_to text, blog_articles_archive_url(:year => archive_month.first, :month => archive_month.last.to_s.rjust(2, '0'))
  end

  def link_to_article(article, options = {})
    link_to h(article.title), article_url(article), options
  end
  
  def article_url(article)
    blog_article_url :permalink => article.slug, :year => article.date.year, :month => article.date.month, :day => article.date.day
  end

  def url_escape(string)
    string.gsub(/([^ a-zA-Z0-9_.-]+)/n) do
      '%' + $1.unpack('H2' * $1.size).join('%').upcase
    end.tr(' ', '+')
  end
  
end

