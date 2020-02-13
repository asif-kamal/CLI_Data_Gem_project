class NewScience::Article
  attr_accessor :name, :date, :url

  @@all = []

  def initialize(name, date, url)
    @name = name
    @date = date
    @URL = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_index(index)
    @@all[index]
  end
end
