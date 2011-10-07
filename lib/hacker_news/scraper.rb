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
    
    def self.comments(item_id)
      response = Net::HTTP.start( "news.ycombinator.com", 80 ) do |http|
        http.get("/item?id=#{item_id}", "User-Agent" => "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.3 (KHTML, like Gecko) Chrome/15.0.872.0 Safari/535.2").body
      end
      doc = Nokogiri::HTML(response)
      comment_images = doc.css('img[src="http://ycombinator.com/images/s.gif"]').select {|c| c.attributes["width"].value == "0"}
      top_level_comments = comment_images.inject([]) do |arr, comment_image|
        comment = comment_image.parent.parent.parent.parent.parent
        arr << Comment.new(item_id, comment) if comment && comment.css("span.comment font")[0]
        arr
      end
    end
    
  end
  
end