class RenameAdressColumnAndPaysColumnInbuyer < ActiveRecord::Migration[7.0]
  def change
    rename_column :buyers, :adress, :address
    rename_column :buyers, :pays, :country
  end
end
