class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :recipe_id
      t.integer :step_number
      t.text :direction

      t.timestamps

    end
  end
end
