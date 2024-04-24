class Performance < ApplicationRecord
  belongs_to :spectacle
  has_many :tickets, dependent: :destroy
  has_many :report_performances, dependent: :destroy
  has_many :reports, through: :report_performances

  validates :date_performance, :start_hour_performance, :end_hour_performance, presence: true

  has_secure_token :performance_token

  def to_param
    performance_token
  end

  def self.average_cost
    all_performance_tickets = tickets
    all_prices = tickets.pluck(:price)
  end
  
end
