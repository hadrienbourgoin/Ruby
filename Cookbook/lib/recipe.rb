#  TODO: Define your Recipe class here
class Recipe
  attr_reader :name, :description, :rating

  def initialize(name, description, rating = "no rating")
    @name = name
    @description = description
    @rating = rating
  end
end
