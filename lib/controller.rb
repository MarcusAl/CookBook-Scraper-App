require_relative 'cookbook'
require_relative 'view'
require_relative 'recipe'
require 'nokogiri'
require 'open-uri'

class Controller
  attr_reader :search_results

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @search_results = []
  end

  def import
    # Store the returned array in a variable
    list = search_string
    # Display the list to user
    @view.display(list)
    # Store the users specified index
    recipe_index = @view.ask_import - 1
    # Add the recipe using cookbook's add recipe method
    @cookbook.add_recipe((@search_results[recipe_index]))
  end

  def search_string
    # Call the parsing method and return the search_results array
    parsing_loop
    @search_results
  end

  def url_string
    # Store the returned value of asking user for a search query
    string = @view.ask_ingredient
    @view.user_wait("Looking for #{string} recipes on the Internet...")
    return "https://www.allrecipes.com/search/results/?search=#{string}"
  end

  def parsing_loop
    # 1. Setup the Nokogiri gem, and arguments
    recipe_elements = Nokogiri::HTML(URI.open(url_string), nil, 'utf-8').search(".card__detailsContainer")[0...5]
    # 2. Loop through the data in recipe elements scraped by the Nokogiri
    recipe_elements.each do |element|
      # 3. Store each recipe detail in a variable
      name = element.search(".card__title").text.strip
      rating = element.search(".review-star-text").text.strip
      summary = element.search(".card__summary").text.strip
      # preptime = element.search("href").text.strip
      # 4. Push each instance of recipe to the search_results array
      @search_results << Recipe.new(name, summary, rating)
    end
  end

  def list
    # Iterate over the array and print each recipe string
    cookbook = @cookbook.all
    @view.display(cookbook)
  end

  def create
    # 1. Get name of recipe from view
    recipe = @view.ask_user("What's the name of your recipe?")
    # 2. Get description of recipe from view
    description = @view.ask_user("What's the description of your recipe?")
    # 3. Get rating of recipe from view
    rating = @view.ask_user("What's the rating of your recipe? (0-5)")
    # 4. Get preptime from user
    preptime = @view.ask_user("What's the preptime of your recipe?")
    new_recipe_details = Recipe.new(recipe, description, "Rating: #{rating} stars", preptime)
    # 5. Add recipe to array using cookbook class
    @cookbook.add_recipe(new_recipe_details)
  end

  def recipe_done?
    recipe = @view.ask_user("Please enter the index of a finished recipe").to_i
    @cookbook.mark_recipe(recipe - 1)
  end

  def destroy
    # 1. Get index from user
    index = @view.ask_user_for_index
    # 2. Remove from repository
    @cookbook.remove_recipe(index)
    # 3. Display modified list to console
  end

  def self.console_log
    private
    # 1. Fetch all instances
    instance_variables
  end
end
