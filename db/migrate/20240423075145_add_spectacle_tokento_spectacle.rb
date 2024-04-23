class AddSpectacleTokentoSpectacle < ActiveRecord::Migration[7.0]
  def change
    add_column :spectacles, :spectacle_token, :string
    add_index :spectacles, :spectacle_token, unique: true
  end
end
