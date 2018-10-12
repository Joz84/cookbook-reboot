require 'csv'
require_relative "recipe"

class Cookbook
  def initialize(csv_path)
    @recipes = []
    @csv_path = csv_path
    load_csv
  end

  def all
    @recipes
  end

  def add(recipe)
    @recipes << recipe
    write_csv
  end

  def destroy(id)
    @recipes.delete_at(id)
    write_csv
  end

  def find(id)
    @recipes[id]
  end

  private

  def load_csv
    CSV.foreach("recipes.csv") do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def write_csv
    CSV.open("recipes.csv", 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

end
