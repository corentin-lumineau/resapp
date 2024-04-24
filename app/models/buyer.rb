class Buyer < ApplicationRecord
    has_many :reservations, dependent: :destroy
    has_many :report_buyers, dependent: :destroy
    has_many :report, through: :report_buyers

    validates :last_name, :first_name, :email, presence: { message: "-> check the buyers data" }
end
