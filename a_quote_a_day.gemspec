require_relative "./lib/a_quote_a_day/version"

Gem::Specification.new do |spec|
  spec.name          = "a_quote_a_day"
  spec.version       = AQuoteADay::VERSION
  spec.date          = "2019-07-31"
  spec.authors       = ["'juan siu'"]
  spec.email         = ["'juan.siu@gmail.com'"]
  spec.files         = ["lib/a_quote_a_day.rb", "lib/a_quote_a_day/cli.rb", "lib/a_quote_a_day/scraper.rb", "lib/a_quote_a_day/quote.rb", "config/environment.rb"]

  spec.summary       = "Best quotes of the internet"
  spec.description   = "Provides with a quote by request on different themes and allow a curated list to be saved"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  s.executables << 'a-quote-a-day'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  
  
end
