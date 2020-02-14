class NewScience::Article
  attr_accessor :name, :date, :url, :desc

  @@all = []

  def initialize(name, date, url, desc = nil)
    @name = name
    @date = date
    @url = url
    @desc = desc
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_index(index)
    @@all[index]
  end
end
