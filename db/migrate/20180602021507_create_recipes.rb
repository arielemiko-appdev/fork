class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredients
      t.text :directions
      t.string :original_source
      t.string :cuisine
      t.string :type_of_dish
      t.string :photo
      t.string :review
      t.string :suggestions
      t.integer :user_id
      t.integer :parent_id

      t.timestamps

    end
  end
end
