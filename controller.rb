require_relative 'view'
require_relative 'recipe'


class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end


  def list
    display_recipes
  end

  def add_recipe
    name = @view.ask_to_user("name")
    description = @view.ask_to_user("description")
    recipe = Recipe.new(name, description)
    @cookbook.add(recipe)
  end

  def remove_task
    display_recipes
    index = @view.ask_to_user_index
    @cookbook.destroy(index)
  end

  def mark_recipe_as_done
    display_recipes
    index = @view.ask_to_user_index
    recipe = @cookbook.find(index)
    recipe.done!
    # Attention cette user story optionnelle n'est pas finie
    # La variable d'instance "done" n'est pas persistée dans le csv
  end


  private

  def display_recipes
    @recipes = @cookbook.all
    @view.display(@recipes)
  end



end
