class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :name
      t.integer :reservations_count
      t.integer :average_age
      t.integer :cost_by_representation

      t.timestamps
    end
  end
end
