class Spectacle < ApplicationRecord
    has_many :performances, dependent: :destroy

    validates :name, presence: true
end
