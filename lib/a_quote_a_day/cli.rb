#CLI controller
class AQuoteADay::CLI
  
  @@favorite = []
  
  def call
    quote
    save
    menu
  end

  def quote
    puts "random quote"
  end

  def save
    puts "would you like to save this quote?"
    input = gets.strip.downcase
    if input == "yes" || input == "y"
    @@favorite << quote
    "quote is now saved"
    elsif input == "no" || input == "n"
    " "
    else
    puts "invalid answer"
    save
    end
  end
  
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
      puts "Motivational quote" 
    elsif input == "2"
      puts "Love quote" 
    elsif input == "3"
      puts "Inspirational quote"  
    elsif input == "4"
      puts "Determination quote" 
    elsif input == "5"
      puts "Poetry quote"    
    elsif input == "6"
      puts "Teamwork quote" 
    elsif input == "7"
      puts "Sports quote" 
    elsif input == "8"
      puts "Movies quote" 
    elsif input == "9"
      menu
      
    else
      puts "invalid answer"
      categories
    end
  end

end