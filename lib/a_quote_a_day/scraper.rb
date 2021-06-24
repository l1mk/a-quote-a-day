class Scraper
  #initial constant
  attr_accessor :quote, :url 
  # get url
  def get_page
    Nokogiri::HTML(open(@url))
  end
  # grab quote from the internet
  def scrape_quote
    doc = get_page.css("blockquote")
    array = doc.map {|quote| quote.text.chomp("Click to tweet")}
    @quote = array.sample
    @quote
  end
  # quote creation method
  def make_quote
    Quote.new(@quote, categorie = "inspirational", @url)
  end
  # initial method  
  def initialize(html = "http://wisdomquotes.com/inspirational-quotes/")
    @url = html
    get_page
    scrape_quote
  end
  
end