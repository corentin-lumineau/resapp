class Reservation < ApplicationRecord
  belongs_to :buyer
  has_many :report_reservations, dependent: :destroy
  has_many :reports, through: :report_reservations

  validates :date_reservation, :hour_reservation, presence: { message: "-> check the reservation data" }

  has_secure_token :reservation_token

  def to_param
    reservation_token
  end
end
