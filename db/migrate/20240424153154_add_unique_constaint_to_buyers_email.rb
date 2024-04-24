class AddUniqueConstaintToBuyersEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :buyers, :email, unique: true
  end
end
