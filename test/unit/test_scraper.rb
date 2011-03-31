require 'helper'

class TestScraper < Test::Unit::TestCase
  
  def test_should_get_articles
    FakeWeb.register_uri(:get, %r|http://news.ycombinator.com|, :body => File.read(File.dirname(__FILE__) + "/../fixtures/index.html"))
    articles = HackerNews::Scraper.articles
    assert_equal 150, articles.size
    first_article = articles[0]
    
    assert_equal "Apple’s boring hardware updates", first_article.title
    assert_equal 1, first_article.position
    assert_equal 127, first_article.points
    assert_equal 59, first_article.comments
    assert_equal 2389994, first_article.id
    assert_equal "remi", first_article.user
    assert_equal "http://www.marco.org/4222285032", first_article.url
    assert_equal "19 hours ago", first_article.created_at
  end
  
end
