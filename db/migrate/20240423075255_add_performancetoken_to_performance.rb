class AddPerformancetokenToPerformance < ActiveRecord::Migration[7.0]
  def change
    add_column :performances, :performance_token, :string
    add_index :performances, :performance_token, unique: true
  end
end
