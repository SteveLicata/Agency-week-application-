class AddColumnToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :imageURLsBySize, :string
    add_column :recipes, :recipeName, :string
    add_column :recipes, :ingredients, :string
    add_column :recipes, :rating, :integer
    add_column :recipes, :sourceRecipeUrl, :string
  end
end
