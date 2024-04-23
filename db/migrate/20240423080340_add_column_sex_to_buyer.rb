class AddColumnSexToBuyer < ActiveRecord::Migration[7.0]
  def change
    add_column :buyers, :sex, :string
  end
end
