class AddElementCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :elements_count, :integer
  end
end
