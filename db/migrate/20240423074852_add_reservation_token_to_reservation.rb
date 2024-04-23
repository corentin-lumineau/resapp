class AddReservationTokenToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :reservation_token, :string
    add_index :reservations, :reservation_token, unique: true
  end
end
