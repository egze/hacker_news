module HackerNews
  
  class Scraper
    
    URL = "http://news.ycombinator.com"
    
    def self.articles(pages = 5)
      
      pagination = ""
      result = []
      
      0.upto(pages - 1) do |page|
        doc = Nokogiri::HTML(open(URL+pagination))
        articles = doc.css("td.title > a:first-child")
        next_page = articles.pop
        pagination = next_page[:href]
        articles.each_with_index {|a, i| result << Item.new(a, (page * 30) + i + 1)}
      end
      
      result
    end
    
  end
  
end