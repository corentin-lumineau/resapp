class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :adress
      t.string :zip_code
      t.string :pays
      t.integer :age

      t.timestamps
    end
  end
end
