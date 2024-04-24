class CreateReportPerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :report_performances do |t|
      t.references :performance, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
