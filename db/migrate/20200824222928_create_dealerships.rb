class CreateDealerships < ActiveRecord::Migration[6.0]
  def change
    create_table :dealerships do |t|
      t.string :title
      t.integer :phone
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zip_code

      t.timestamps
    end
  end
end
