$LOAD_PATH.unshift(File.dirname(__FILE__))
#$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'net/http'
require 'open-uri'
require 'nokogiri'
require 'iconv'
require 'hacker_news/comment'
require 'hacker_news/item'
require 'hacker_news/scraper'