class Spectacle < ApplicationRecord
    has_many :performances, dependent: :destroy

    validates :name, presence: { message: "-> check the spectacle data" }

    has_secure_token :spectacle_token

    def to_param
        spectacle_token
    end


end
