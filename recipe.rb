class Recipe
  attr_reader :name, :description
  def initialize(name, description)
    @name = name
    @description = description
    @done = false
  end

  def done!
    @done = true
  end

  def done?
    @done
  end
end
