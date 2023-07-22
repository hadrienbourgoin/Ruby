# TODO: Implement the Cookbook class that will be our repository
require "csv"
require_relative "recipe"

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def load_csv
    if File.exist?(@csv_file_path)
      csv_file = CSV.parse(File.read(@csv_file_path))
      csv_file.each { |item| @recipes << Recipe.new(item[0], item[1]) }
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb', col_sep: ',', force_quotes: true, quote_char: '"') do |csv|
      @recipes.each { |recipe| csv << [recipe.name, recipe.description, recipe.rating] }
    end
  end
end
