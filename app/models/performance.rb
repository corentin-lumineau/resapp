class Performance < ApplicationRecord
  belongs_to :spectacle
  has_many :tickets, dependent: :destroy

  validates :date_performance, :start_hour_performance, :end_hour_performance, presence: true
end
