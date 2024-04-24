class AddColumnDateEndPerformanceToPerformance < ActiveRecord::Migration[7.0]
  def change
    add_column :performances, :date_end_performance, :datetime
  end
end
