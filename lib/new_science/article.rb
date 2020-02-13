class NewScience::Article
  attr_accessor :name, :date, :URL

  @@all = []

  def initialize(name, date, URL)
    @name = name
    @date = date
    @URL = tickets_URL
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_index(index)
    @@all[index]
  end
end
