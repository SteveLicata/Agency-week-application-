class AddColumnsToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :user_id, :integer
    add_column :recipes, :ingredient_of_the_day, :string
  end
end
