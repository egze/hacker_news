module HackerNews
  
  class Item
    
    attr_accessor :id, :position, :points, :title, :url, :comments, :user, :created_at
    
    def initialize(node, position)
      tr = node.parent.parent
      points_comments_tr = tr.next
      points_comments_td = points_comments_tr.css("td.subtext")[0]
      
      @title = Iconv.iconv('iso-8859-1//translit', 'utf-8', node.text)[0].to_s.strip
      @url = node[:href]
      @position = position
      @points = points_comments_td.css("span")[0].text.to_i
      @id = points_comments_td.css("span")[0][:id].split("_")[1].to_i
      @user = points_comments_td.css("a")[0].text.strip
      @comments = points_comments_td.css("a")[1].text.to_i
      @created_at = points_comments_td.text.match(/by [-\w]+ (.*) \|/)[1].strip rescue ""
    end
    
  end
  
end