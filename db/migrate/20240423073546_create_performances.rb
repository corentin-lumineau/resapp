class CreatePerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :performances do |t|
      t.datetime :date_performance
      t.time :start_hour_performance
      t.time :end_hour_performance
      t.references :spectacle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
