class NewScience::Scraper

def self.scrape
  doc = Nokogiri::HTML(open("https://www.nsf.gov/news/index.jsp?news_type=99&prio_area=0&org=NSF"))

  whole_page = doc.css(".col-md-12 l-add-border")
  whole_page.each do |news|
  date = news.css("span.l-media__date").text.strip
  name = news.css("p media-heading l-media_heading").text.strip
  url = news.css("a l-media_heading__link--heading")
#binding.pry
  end
  NewScience::Article.new(name, date)
end

def self.get_description
  doc = Nokogiri::HTML(open("https://www.nsf.gov/news/index.jsp?news_type=99&prio_area=0&org=NSF"))
