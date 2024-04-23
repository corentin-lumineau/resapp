class Reservation < ApplicationRecord
  belongs_to :buyer

  validates :date_reservation, :hour_reservation, presence: true
end
