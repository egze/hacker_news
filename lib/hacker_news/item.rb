module HackerNews
  
  class Item
    
    attr_accessor :id, :position, :points, :title, :url, :comments_count, :user, :created_at
    
    def initialize(node, position)
      @title = node.text
      @url = node[:href]
      @position = position
      
      tr = node.parent.parent
      points_comments = tr.next
      
    end
    
  end
  
end