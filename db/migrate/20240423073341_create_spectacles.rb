class CreateSpectacles < ActiveRecord::Migration[7.0]
  def change
    create_table :spectacles do |t|
      t.string :name

      t.timestamps
    end
  end
end
