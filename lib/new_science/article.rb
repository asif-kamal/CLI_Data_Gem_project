#require "new_science/version"

class NewScience::Article
  attr_accessor :name, :price, :availability, :url

  def self.today
    # Scrape woot and meh and then return deals based on that data
    self.scrape_deals
  end

  def self.scrape_deals
    deals = []

    deals << self.scrape_woot
    deals << self.scrape_meh

    deals
  end

  def self.scrape
    doc = Nokogiri::HTML(open("https://www.nsf.gov/news/index.jsp?news_type=99&prio_area=0&org=NSF"))

    whole_page = doc.css(".col-md-12 l-add-border")
    whole_page.each do |news|
    date = news.css("span.l-media__date").text.strip
    name = doc.search("p media-heading l-media_heading").text.strip
    url = doc.search("a.l-media__link--heading").first.attr("href").strip
binding.pry
    end
    article = self.new

  end


end
