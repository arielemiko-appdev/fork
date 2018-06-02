class AddStepCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :steps_count, :integer
  end
end
