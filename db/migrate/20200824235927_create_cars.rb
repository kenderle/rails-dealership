class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :color
      t.text :description
      t.integer :price
      t.belongs_to :dealership, null: false, foreign_key: true
      t.integer :cost
      t.string :image

      t.timestamps
    end
  end
end
