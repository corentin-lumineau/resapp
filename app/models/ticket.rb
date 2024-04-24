class Ticket < ApplicationRecord
  belongs_to :reservation
  belongs_to :performance

  validates :price, :product_type, :sales_channel, presence: { message: "-> check the tickets data" } 

  has_secure_token :ticket_token

  def to_param
    ticket_token
  end
end
