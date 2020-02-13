class NewScience::CLI

  require 'colorize'

  def call
    NewScience::Scraper.scrape
    welcome
    start
    menu
  end

  def welcome

    puts "Welcome to the National Science Foundation for new research."

  end

  def start
    puts "These are the most recent articles on new scientific discoveries:"

      articles = RedRocks::Article.all
      articles.each.with_index(1) {|article, index| puts "#{index}. #{article.name}"}


  end

  def menu
    puts ""
    puts "Please select the article number you want to read. When you are ready to leave the NSF, type exit."
      input = gets.strip

    if input.to_i > 0
      article_choice = NewScience::Article.find_by_index(input.to_i - 1)
      puts ""
      puts "#{article_choice.date}"
      puts "#{article_choice.name}"
      puts ""
      puts "For tickets and more information, please visit:".cyan
      puts "#{concert_choice.tickets_URL}"
      puts ""
      puts "///////////////////////////////////////////////////////////////////////////"
      menu
    elsif
      input == "exit"
      puts ""
      puts "See ya out there!!".bold
      puts ""
      system "clear" or system "cls"
    else
      puts "Please try again."
      menu
    end
  end
end
