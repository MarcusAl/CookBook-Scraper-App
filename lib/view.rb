require_relative 'cookbook'
require_relative 'recipe'
require_relative 'controller'
class View
  def display(list)
    # Display the current recipes to user with formatting
    puts "-- Here are all your recipes --"
    list.each_with_index do |recipe, index|
      puts '*' * 50
      puts recipe.completed
      puts "#{index + 1}. #{recipe.name} "
      puts recipe.description
      puts recipe.rating
      puts recipe.preptime
      puts '*' * 50
    end
  end

  def ask_rating
    puts "How would you rate this recipe? (1-5)"
    return gets.chomp.to_i
  end

  def ask_import
    puts "What recipe would you like to import? (enter index)"
    return gets.chomp.to_i
  end

  def ask_ingredient
    puts "What ingredient would you like a recipe for?"
    return gets.chomp
  end

  def ask_user(message)
    puts message
    print "> "
    return gets.chomp
  end

  def user_wait(message)
    puts message
  end

  def ask_user_for_index
    puts "Index?"
    return gets.chomp.to_i - 1
  end

  def user_error
    puts "Error, the input you provided is invalid."
  end

  def self.console_log
    private
    # 1. Fetch all instances
    instance_variables
  end
end
