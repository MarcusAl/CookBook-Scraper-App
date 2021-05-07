class Recipe
  attr_reader :name, :description, :rating
  attr_accessor :completed, :preptime

  def initialize(name, description, rating, preptime = '', completed = "[]")
    @name = name
    @description = description
    @rating = rating
    @completed = completed
    @preptime = preptime
  end
end
