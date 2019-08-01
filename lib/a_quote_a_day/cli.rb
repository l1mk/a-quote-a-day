#CLI controller

class AQuoteADay::CLI
  
  @@favorite = []
  
  def call
    quote = Quote.new
    quote.call
    menu
  end

  #def quote(random = "here is a random quote")
  #  @quote = random
  #  puts @quote
  #end

  #def saving
  #  @@favorite << @quote
  #end

  #def save?
  #  puts "would you like to save this quote?"
  #  input = gets.strip.downcase
  #    if input == "yes" || input == "y"
  #      saving
  #      puts "quote is now saved"
  #      puts " "
  #    elsif input == "no" || input == "n"
  #      puts " "
  #    else
  #      puts "invalid answer"
  #      save?
  #    end
  #end
  
  def menu
    puts "Welcome to A Quote A Day"
    puts "Here is your options, please type the number of what do you want to access"
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
    puts "Enjoy the rest of your day"
      exit 
    else
      puts "invalid answer"
      menu
    end
  end
  
  def categories
    puts "Here is the list of categories, choose the number of the option you want"
    puts <<-DOC
1. Motivational
2. Love 
3. Inspirational
4. Determination
5. Poetry 
6. Teamwork
7. Sports
8. Movies
9. Back to Main Menu
DOC
  input = gets.strip.downcase
  if input == "1"
      Quote.new("Motivational quote", categorie = "Motivational").call
      puts " "
      categories
    elsif input == "2"
      Quote.new("Love quote", categorie = "Love").call
      puts " "
      categories
    elsif input == "3"
      Quote.new("Inspirational quote", categorie = "Inspirational").call
      puts " "
      categories
    elsif input == "4"
      Quote.new("Determination quote", categorie = "Determination").call
      puts " "
      categories
    elsif input == "5"
      Quote.new("Poetry quote", categorie = "Poetry").call 
      puts " "
      categories
    elsif input == "6"
      Quote.new("Teamwork quote", categorie = "Teamwork").call
      puts " "
      categories
    elsif input == "7"
      Quote.new("Sports quote", categorie = "Sports").call
      puts " "
      categories
    elsif input == "8"
      Quote.new("Movies quote", categorie = "Movies").call
      puts " "
      categories
    elsif input == "9"
      menu
      
    else
      puts "invalid answer"
      categories
    end
  end

  def favorites
    puts "What would you like to do?"
    puts <<-DOC
1. List of all favorites
2. Print last
3. Erase last
4. Erase all
5. Find by Keyword
6. Back
DOC
      input = gets.strip.downcase
      if input == "1"
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
      puts "Write down a keyword"
      key = gets.strip
        Quote.find_by_keyword(key)
        favorites
      elsif input == "6"
        menu   
      else 
        puts "invalid answer"
        favorites
      end
  end
  
  #def find_by_keyword(key)
  #quote.include?(key)
  #puts quote
  #end
  
end