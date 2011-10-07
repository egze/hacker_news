# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hacker_news}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aleksandr Lossenko"]
  s.date = %q{2011-10-07}
  s.description = %q{Fetches newest 5 pages from Hacker News and returns convenient ruby objects}
  s.email = %q{aleksandr.lossenko@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "hacker_news.gemspec",
    "lib/hacker_news.rb",
    "lib/hacker_news/comment.rb",
    "lib/hacker_news/item.rb",
    "lib/hacker_news/scraper.rb",
    "test/fixtures/comments.html",
    "test/fixtures/index.html",
    "test/helper.rb",
    "test/unit/test_scraper.rb"
  ]
  s.homepage = %q{http://github.com/egze/hacker_news}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Wrapper for Hacker News website}
  s.test_files = [
    "test/helper.rb",
    "test/unit/test_scraper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.4.0"])
      s.add_runtime_dependency(%q<iconv>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.4.0"])
      s.add_dependency(%q<iconv>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.4.0"])
    s.add_dependency(%q<iconv>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
  end
end

