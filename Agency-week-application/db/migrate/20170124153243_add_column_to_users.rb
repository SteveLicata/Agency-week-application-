class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :favorite_protein, :string
    add_column :users, :favorite_vegetables, :string
    add_column :users, :allergies, :string
  end
end
