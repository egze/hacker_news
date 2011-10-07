module HackerNews
  
  class Comment
    
    attr_accessor :item_id, :level, :html, :node, :children, :user, :created_at, :url
    
    def initialize(item_id, node)
      @item_id = item_id
      @node = node
      @user = node.css("span.comhead a")[0].text
      @url = "http://news.ycombinator.com/" + node.css("span.comhead a")[1].attributes["href"].value
      @created_at = node.css("span.comhead")[0].children[1].text.strip[0..-4] rescue nil
      @html = node.css("span.comment font")[0].inner_html
      @level = node.css('img[src="http://ycombinator.com/images/s.gif"]')[0].attributes["width"].value.to_i
      @children = []
    end
    
    def comments
      chidren = []
      next_node = node.next
      return chidren unless next_node
      next_comment = next_node ? self.class.new(self.item_id, next_node) : nil
      while next_node && next_comment && self.root_of?(next_comment) && self.parent_of?(next_comment)
        children << next_comment
        
        next_node = next_node.next
        next_comment = next_node ? self.class.new(self.item_id, next_node) : nil
      end
      children
    end
    
    def root_of?(other_comment = nil)
      other_comment && self.level < other_comment.level
    end
    
    def parent_of?(other_comment = nil)
      other_comment && self.level + 40 == other_comment.level
    end
    
  end
  
end