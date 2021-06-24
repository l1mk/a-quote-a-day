class Quote
  #initial constant
  attr_accessor :quote, :categorie, :url 
  @@all = []
  
  # initial method on creation
  def initialize(quote = "random quote", categorie = "inspirational", url = "www.com")
      @quote = quote
      @categorie = categorie
      @url = url
  end
  # see all method
  def self.all
      @@all
  end
  # make favorite method
  def self.favorite
      @@all.map.with_index {|q,i| puts "#{i+1}.- '#{q.quote}',(#{q.categorie} quote from #{q.url})."}
  end
  # saving method
  def saving
      @@all << self
  end
  # saving confirmation method
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
  # erase all method
  def self.clear
    @@all = []
  end
  # erase last method
  def self.delete_last
    @@all.pop
    @@all 
  end
  # call quote method 
  def call 
    puts "'#{@quote}.'"
    puts " "
    save?
  end
  # call last quote saved method  
  def self.call_last
    puts @@all.last.quote
  end
  # search by word method
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
  # search by category method
  def self.find_by_categorie(categorie)
    finding = @@all.map {|q| 
    if q.categorie == categorie
    puts "-'#{q.quote}'-, Category: #{q.categorie} quote."
    else
    false  
    end
    }
    
    if finding.all?(false)
      puts "Please, try a different categorie."
    end
  end
  
end
    