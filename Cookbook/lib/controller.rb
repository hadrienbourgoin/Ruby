#  TODO: Define your Controller Class here, to orchestrate the other classes
require_relative "recipe"
require_relative "view"
require_relative "scrape_all_recipes_service"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_list(@cookbook.all)
  end

  def add
    array = @view.ask_recipe
    recipe = Recipe.new(array[0], array[1], array[2])
    @cookbook.create(recipe)
  end

  def remove
    i = @view.ask_for_index(@cookbook.all)
    @cookbook.destroy(i) if (1..@cookbook.all.size).include?(i + 1)
  end

  def ideas
    ingredient = @view.ask_ingredient
    recipes = ScrapeAllRecipesService.scraping(ingredient)
    @view.display_ideas(recipes)
    i = @view.ask_for_import(recipes)
    @cookbook.create(recipes[i]) unless recipes[i].nil?
  end
end
