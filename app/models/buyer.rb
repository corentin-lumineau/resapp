class Buyer < ApplicationRecord
    has_many :reservations, dependent: :destroy

    validates :last_name, :first_name, :email, :address, :zip_code, :country, :age, :sex, presence: true
end
