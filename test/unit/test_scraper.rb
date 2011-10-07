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
    assert_equal 32, first_article.comments
    assert_equal 3081171, first_article.id
    assert_equal "matthiaswh", first_article.user
    assert_equal "https://docs.google.com/spreadsheet/ccc?key=0AgdrTOOiB3BMdExDMXAtUmhrNnQwUXRjZHh1QVhzRHc&hl=en_US", first_article.url
    assert_equal "15 hours ago", first_article.created_at
    
    job_article = articles[18]
    
    assert_equal "PagerDuty (YC S10) is looking for some awesome devs", job_article.title
    assert_equal 19, job_article.position
    assert_equal nil, job_article.points
    assert_equal nil, job_article.comments
    assert_equal nil, job_article.id
    assert_equal nil, job_article.user
    assert_equal "http://www.pagerduty.com/jobs/engineering/software-engineer", job_article.url
    assert_equal "12 hours ago", job_article.created_at
  end
  
end
