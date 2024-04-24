class CreateReportBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :report_buyers do |t|
      t.references :buyer, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
