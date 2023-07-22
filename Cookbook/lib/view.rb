# TODO: Define your View class here, to display elements to the user and ask them for their input
class View
  def display_list(recipes)
    puts "#######"
    recipes.each_with_index do |recipe, i|
      puts "#{i + 1}. #{recipe.name}: #{recipe.description}\n#{recipe.rating}"
    end
    puts "#######"
  end

  def list_index(recipes)
    indexes = ""
    recipes.each_with_index do |_, i|
      indexes += "#{i + 1} "
    end
    "#{indexes}:"
  end

  def ask_recipe
    puts "Enter the name of your recipe:"
    name = gets.chomp
    puts "Enter the description of your recipe:"
    description = gets.chomp
    puts "Enter the rating of your recipe:"
    rating = gets.chomp
    [name, description, rating]
  end

  def ask_for_index(recipes)
    puts "choose an index among: #{list_index(recipes)}"
    i = gets.chomp.to_i - 1
    puts "index out of range" unless (1..recipes.size).include?(i + 1)
    i
  end

  def ask_ingredient
    puts "What ingredient would you like a recipe for?"
    ingredient = gets.chomp
    puts "Looking for \"#{ingredient}\" recipes on the Internet..."
    ingredient
  end

  def display_ideas(array)
    array.each_with_index { |recipe, index| puts "#{index + 1}: #{recipe.name}\n" }
  end

  def ask_for_import(recipes)
    i = ask_for_index(recipes)
    puts "Importing \"#{recipes[i].name}\"..." if (1..recipes.size).include?(i + 1)
    i
  end
end
