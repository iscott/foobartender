class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :alcohol
      t.string :mixer
      t.string :finish
      t.boolean :over_ice
      t.integer :price
      t.boolean :top_shelf

      t.timestamps
    end
  end
end
