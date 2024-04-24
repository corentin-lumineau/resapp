class CreateReportReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :report_reservations do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
