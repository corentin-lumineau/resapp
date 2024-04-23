class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :date_reservation
      t.time :hour_reservation
      t.references :buyer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
