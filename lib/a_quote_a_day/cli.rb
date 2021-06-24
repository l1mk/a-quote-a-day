class AQuoteADay::CLI
  #initial constant
  @@favorite = []
  @@types = ["peace", "life", "short", "happiness", "gratitude", "friendship", "kindness", "words-of-wisdom"]

  # call first quote method
  def call
    new = Scraper.new.make_quote
    new.call
    menu
  end

  # initial menu method
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
    # respond to inputs on initial menu
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
  # categories menu method
  def categories
    puts "Here is the list of categories, choose the number of the option you want."
    puts ""
    puts <<-DOC
      1. Peace
      2. Life
      3. Short
      4. Happiness
      5. Gratitude
      6. Frienship
      7. Kindness
      8. Wisdom
      9. Back to Main Menu
    DOC
    # respond to inputs on categories method
    input = gets.to_i - 1
      if input.between?(0,6)
          new_selection = Scraper.new("http://wisdomquotes.com/#{@@types[input]}-quotes/").make_quote
          new_selection.call
          new_selection.categorie = "#{@@types[input]}"
          puts " "
          categories
      elsif input == 7
        new_selection = Scraper.new("http://wisdomquotes.com/#{@@types[input]}/").make_quote
        new_selection.call
        new_selection.categorie = "#{@@types[input]}"
        puts " "
        categories
      elsif input == 8
          menu
      else
          puts "Invalid answer!"
          categories
      end
  end
  # favorites menu method      
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
    # respond to inputs on favorites method
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
