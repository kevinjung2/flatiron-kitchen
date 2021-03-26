class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ing|
      ing.values.each do |name|
        i = Ingredient.find_or_create_by(name: name)
        self.ingredients << i if i.valid?
      end
    end
  end
end
