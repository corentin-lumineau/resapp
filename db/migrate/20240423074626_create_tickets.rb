class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :price
      t.string :product_type
      t.string :sales_channel
      t.references :reservation, null: false, foreign_key: true
      t.references :performance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
