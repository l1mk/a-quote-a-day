class Quote
  attr_accessor :quote, :categorie, :url 
  @@all = []
  
  def initialize(quote = "random quote", categorie = nil, url = "www.com")
      @quote = quote
      @categorie = categorie
      @url = url
  end
  
  def self.all
      @@all
  end
    
  def self.favorite
      @@all.map {|q| q.quote}
  end
    
  def saving
      @@all << self
  end
    
  def save?
    puts "Would you like to save this Quote?."
    input = gets.strip.downcase
      if input == "yes" || input == "y"
        self.saving
        puts "...Quote is now saved!."
        puts " "
      elsif input == "no" || input == "n"
        puts " "
      else
        puts "Invalid answer!."
        save?
      end
  end
    
  def self.clear
    @@all = []
  end
    
  def self.delete_last
    @@all.pop
    @@all 
  end
    
  def call 
    puts "'#{@quote}.'"
    puts " "
    save?
  end
    
  def self.call_last
    puts @@all.last.quote
  end
    
  def self.find_by_keyword(keyword)
    finding = @@all.map {|q| 
    if q.quote.downcase.include?(keyword)
    puts q.quote
    else
    false  
    end
    }
    
    if finding.all?(false)
        puts "Please, try a different keyword."
    end
  end
  
  def self.find_by_categorie(categorie)
    finding = @@all.map {|q| 
    if q.categorie == categorie
    puts "#{q.quote}. Category: #{q.categorie} quote"
    else
    false  
    end
    }
    
    if finding.all?(false)
      puts "Please, try a different categorie."
    end
  end
  
    
end
    