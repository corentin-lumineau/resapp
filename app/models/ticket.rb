class Ticket < ApplicationRecord
  belongs_to :reservation
  belongs_to :performance

  validates :price, :product_type, :sales_channel
end
