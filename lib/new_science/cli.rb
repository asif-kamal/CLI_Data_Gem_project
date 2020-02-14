class NewScience::CLI
  require 'pry'

  def call
    NewScience::Scraper.scrape
    welcome
    start
    list
  end

  def welcome

    puts "Welcome to the National Science Foundation for new research.".cyan

  end

  def start
    puts "These are the most recent articles on new scientific discoveries:".cyan

    articles = NewScience::Article.all

    articles.each.with_index(1) {|article, index| puts "#{index}. #{article.name}".white.on_blue}
  end

  def list
    puts ""
    puts "Please select the article number you want more info on. When you are ready to leave the NSF, type exit.".cyan
    input = gets.strip

    if input.to_i > 0
      article_choice = NewScience::Article.find_by_index(input.to_i - 1)
      puts ""
      puts "#{article_choice.date}".white.on_blue
      puts "#{article_choice.name}".white.on_blue
      puts "#{article_choice.url}".white.on_blue
      puts ""
      puts "Do you want to read an excerpt of the journal article? Type 'yes' or 'no'.".cyan
      input = gets.strip
      if input == 'yes'
        puts article_choice.desc.white.on_blue
        puts "For greater detail on the study, visit #{article_choice.url}".white.on_blue
      elsif input == 'no'
        start
        list
      end
    elsif input == 'exit'
      puts "Thank you for visiting the NSF website!".cyan
    else
      puts "Please enter a valid input.".red
    end
  end


end
