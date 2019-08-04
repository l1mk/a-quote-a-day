class AQuoteADay::CLI
 @@favorite = []
  
  def call
    new = Scraper.new.make_quote
    new.call
    menu
  end

  def menu
    puts "**Welcome to A Quote A Day!**"
    puts "" 
    puts "Here are your options, please type the number of what do you want to access."
    puts ""
    puts <<-DOC
1. Categories
2. Favorites
3. Exit
    DOC
    
    input = gets.strip.downcase
    if input == "1"
      categories 
    elsif input == "2"
      favorites 
    elsif input == "3"
    puts "Enjoy the rest of your day!."
      exit 
    else
      puts "Invalid answer!."
      menu
    end
  end
  
  def categories
    puts "Here is the list of categories, choose the number of the option you want."
    puts ""
    puts <<-DOC
1. Motivational
2. Life 
3. Short
4. Wisdom
5. Happiness 
6. Gratitude
7. Frienship 
8. Kindness
9. Back to Main Menu
DOC

     input = gets.strip.downcase
    if input == "1"
      new = Scraper.new("http://wisdomquotes.com/motivational-quotes/").make_quote
      new.call
      new.categorie = "motivational"
      puts " "
      categories
    elsif input == "2"
      new = Scraper.new("http://wisdomquotes.com/life-quotes/").make_quote
      new.call
      new.categorie = "life"
      puts " "
      categories
    elsif input == "3"
      new = Scraper.new("http://wisdomquotes.com/short-quotes/").make_quote
      new.call
      new.categorie = "short"
      puts " "
      categories
    elsif input == "4"
      new = Scraper.new("http://wisdomquotes.com/words-of-wisdom/").make_quote
      new.call
      new.categorie = "wisdom"
      puts " "
      categories
    elsif input == "5"
      new = Scraper.new("http://wisdomquotes.com/happiness-quotes/").make_quote
      new.call
      new.categorie = "happiness"
      puts " "
      categories
    elsif input == "6"
      new = Scraper.new("http://wisdomquotes.com/gratitude-quotes/").make_quote
      new.call
      new.categorie = "gratitude"
      puts " "
      categories
    elsif input == "7"
      new = Scraper.new("http://wisdomquotes.com/friendship-quotes/").make_quote
      new.call
      new.categorie = "friendship"
      puts " "
      categories
    elsif input == "8"
      new = Scraper.new("http://wisdomquotes.com/kindness-quotes/").make_quote
      new.call
      new.categorie = "kindness"
      puts " "
      categories
    elsif input == "9"
      menu 
    else
      puts "Invalid answer!"
      categories
    end
  end

  def favorites
    puts "What would you like to do?."
    puts ""
    puts <<-DOC
1. List of all favorites
2. Print last
3. Erase last
4. Erase all
5. Find by Keyword
6. Find by Category
7. Back
DOC
    input = gets.strip.downcase
      if input == "0"
        puts Quote.all
      elsif input == "1"
        puts Quote.favorite 
        favorites
      elsif input == "2"
        puts Quote.call_last
        favorites
      elsif input == "3"
        Quote.delete_last
        puts Quote.favorite
        favorites
      elsif input == "4"
        Quote.clear
        favorites
      elsif input == "5"
      puts "Write down a keyword."
      puts ""
      key = gets.strip.downcase
        Quote.find_by_keyword(key)
        favorites
      elsif input == "6"
      puts "Write down a Categorie."
      puts ""
      categorie = gets.strip.downcase
        Quote.find_by_categorie(categorie)
        favorites
      elsif input == "7"
        menu   
      else 
        puts "Invalid answer!."
        favorites
      end
  end
end