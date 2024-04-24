class RemoveColumnsFromReport < ActiveRecord::Migration[7.0]
  def change
    remove_column :reports, :reservations_count, :integer
    remove_column :reports, :average_age, :integer
    remove_column :reports, :cost_by_representation, :integer
  end
end
