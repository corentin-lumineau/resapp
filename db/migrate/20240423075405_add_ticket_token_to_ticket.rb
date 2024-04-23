class AddTicketTokenToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :ticket_token, :string
    add_index :tickets, :ticket_token, unique: true
  end
end
