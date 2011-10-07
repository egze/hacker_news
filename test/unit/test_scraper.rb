require 'helper'

class TestScraper < Test::Unit::TestCase
  
  def test_should_get_articles
    FakeWeb.register_uri(:get, %r|http://news.ycombinator.com|, :body => File.read(File.dirname(__FILE__) + "/../fixtures/index.html"))
    articles = HackerNews::Scraper.articles
    assert_equal 150, articles.size
    first_article = articles[0]
    
    assert_equal "Show HN: My table of tools for startups [Google Docs]", first_article.title
    assert_equal 1, first_article.position
    assert_equal 117, first_article.points
    assert_equal 32, first_article.comments_count
    assert_equal 3081171, first_article.item_id
    assert_equal "matthiaswh", first_article.user
    assert_equal "https://docs.google.com/spreadsheet/ccc?key=0AgdrTOOiB3BMdExDMXAtUmhrNnQwUXRjZHh1QVhzRHc&hl=en_US", first_article.url
    assert_equal "15 hours ago", first_article.created_at
    
    job_article = articles[18]
    
    assert_equal "PagerDuty (YC S10) is looking for some awesome devs", job_article.title
    assert_equal 19, job_article.position
    assert_equal nil, job_article.points
    assert_equal 0, job_article.comments_count
    assert_equal nil, job_article.item_id
    assert_equal nil, job_article.user
    assert_equal "http://www.pagerduty.com/jobs/engineering/software-engineer", job_article.url
    assert_equal "12 hours ago", job_article.created_at
  end
  
  def test_should_get_comments
    FakeWeb.register_uri(:get, %r|http://news.ycombinator.com|, :body => File.read(File.dirname(__FILE__) + "/../fixtures/comments.html"))
    comments = HackerNews::Scraper.comments(3083797)
    assert_equal 26, comments.size
    comment = comments[0]
    assert_equal "tzury", comment.user
    assert_equal "41 minutes ago", comment.created_at
    assert_equal "http://news.ycombinator.com/item?id=3084288", comment.url
    assert comment.html =~ /^The content/
    
    comment = comments[1]
    assert_equal 1, comment.comments.size
  end
  
end
