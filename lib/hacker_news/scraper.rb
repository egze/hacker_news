module HackerNews
  
  class Scraper
    
    URL = "news.ycombinator.com"
    
    def self.articles(pages = 5)
      
      pagination = "/"
      result = []
      
      0.upto(pages - 1) do |page|
        response =  Net::HTTP.start( URL, 80 ) do |http|
          http.get(pagination, "User-Agent" => "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.872.0 Safari/535.2").body
        end
        doc = Nokogiri::HTML(response)
        articles = doc.css("td.title > a:first-child")
        next_page = articles.pop
        pagination = next_page[:href]
        articles.each_with_index {|a, i| result << Item.new(a, (page * 30) + i + 1)}
      end
      
      result
    end
    
  end
  
end