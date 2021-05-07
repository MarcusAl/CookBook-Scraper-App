require_relative 'recipe'
require 'csv'
# This class stores the methods which modify the recipes array
# It also modifies the csv methods, and calls on controller or view classes
class Cookbook
  attr_accessor :recipes, :csv_file_path

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    initial_csv
  end

  def initial_csv
    # Initialise the csv with the current recipes
    CSV.foreach(csv_file_path) { |val| @recipes << Recipe.new(val[0], val[1], val[2], val[3], val[4]) }
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    # 1. Store the recipe in the array
    @recipes << recipe
    # 2. Store the recipe is the csv
    store_csv_data
  end

  def store_csv_data
    CSV.open(@csv_file_path, 'w') do |f|
      @recipes.each { |rec| f << [rec.name] + [rec.description] + [rec.rating] + [rec.preptime] + [rec.completed] }
    end
  end

  def mark_recipe(recipe_index)
    @recipes[recipe_index].completed = "[X]"
  end

  def remove_recipe(recipe_index)
    # Prompt user if the index is not there
    if @recipes[recipe_index]
      @recipes.delete_at(recipe_index)
      store_csv_data
      # Otherwise delete the recipe at the specified index
    else
      @view.user_error
    end
  end

  def self.console_log
    private
    # 1. Fetch all instances
    instance_variables
  end
end
