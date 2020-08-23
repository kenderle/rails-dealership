class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :position
      t.string :password_digest
      t.string :token

      t.timestamps
    end
  end
end
