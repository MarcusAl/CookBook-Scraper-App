require 'nokogiri'
require 'open-uri'
url = "https://www.allrecipes.com/search/results/?search="
file = 'strawberry.html'
doc = Nokogiri::HTML(URI.open(url), nil, 'utf-8')
# doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')
# recipe_elements2 = doc.xpath("/html[@class='wf-sourcesanspro-n7-active wf-sourcesanspro-
# n6-active wf-sourcesanspro-n4-active wf-sourcesanspro-i4-active wf-active']/body[@class='template-search node-
# faceted karma-site-container alrcom under-social']/main[@class='component search-results search-results-faceted']/
# div[@class='search-results-content']/div[@class='search-results-content-container']/div[@class=
# 'search-results-content-results-wrapper grid-view']/div
# [@class='component card card__recipe card__facetedSearchResult'][3]/div[@class='card__detailsContainer']
# /div[@class='card__detailsContainer-left']/a[@class='card__titleLink manual-link-behavior']/h3[@class='card__title']")

recipe_elements = doc.search(".card__titleLink h3")

recipe_elements.each do |element|
  puts element.text
end
