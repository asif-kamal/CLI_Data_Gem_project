class NewScience::Scraper

  def self.scrape

    doc = Nokogiri::HTML(open("https://www.nsf.gov/news/index.jsp?news_type=99&prio_area=0&org=NSF"))

    whole_page = doc.css(".media.l-media")
    whole_page.each do |news|

      date = news.css("span.l-media__date").text.strip
      name = news.css(".media-heading.l-media__heading").text.strip
      url = "https://www.nsf.gov" + "#{news.css("a").attr("href").value}"

      NewScience::Article.new(name, date, url)
    end

    NewScience::Article.all.each do |article|

      doc = Nokogiri::HTML(open(article.url))

      article.desc = doc.css("p:nth-child(7)").text.strip
    end
  end


end
