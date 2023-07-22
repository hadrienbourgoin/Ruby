require_relative "recipe"
require "nokogiri"
require "open-uri"

class ScrapeAllRecipesService
  def self.scraping(ingredient)
    recipes = []
    names = retriever("https://www.allrecipes.com/search?q=#{ingredient}", ".card__title-text", true)
    hrefs = retriever("https://www.allrecipes.com/search?q=#{ingredient}", ".mntl-card-list-items", false)
    i = 0
    5.times do
      descs = retriever(hrefs[i], "#article-subheading_1-0", true)
      recipes << Recipe.new(names[i], descs[0])
      i += 1
    end
    recipes
  end

  def self.retriever(html, condition, text_or_href)
    html_content = URI.open(html).read
    doc = Nokogiri::HTML.parse(html_content)
    array = []
    doc.search(condition).each { |element| text_or_href ? array << element.text.strip : array << element["href"] }
    array
  end
end
