class Scraper
  attr_accessor :quote, :url 
  
  def get_page
    
    Nokogiri::HTML(open(@url))
  end
  
  def scrape_quote
    doc = get_page.css("blockquote")
    array = doc.map {|quote| quote.text.chomp("Click to tweet")}
    @quote = array.sample
    @quote
  end
  
  def make_quote
    Quote.new(@quote, categorie = "inspirational", @url)
  end
    
  def initialize(html = "http://wisdomquotes.com/inspirational-quotes/")
    @url = html
    get_page
    scrape_quote
  end
  
end