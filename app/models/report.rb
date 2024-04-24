class Report < ApplicationRecord
    has_one_attached :file
    has_many :report_reservations, dependent: :destroy
    has_many :reservations, through: :report_reservations
    has_many :report_buyers, dependent: :destroy
    has_many :buyers, through: :report_buyers
    has_many :report_performances, dependent: :destroy
    has_many :performances, through: :report_performances

    def get_report_average_age
        ages = buyers.includes(:report_buyers).pluck(:age).compact
        average = ages.inject{ |sum, el| sum + el }.to_f / ages.size
        average.round
    end

    def get_report_average_performance_cost
            data = []
            performances.includes(tickets: :performance).each do |performance|
                inputs = {}
                prices = performance.tickets.pluck(:price)
                average_price = prices.inject{ |sum, el| sum + el }.to_f / prices.size
                inputs[:name] = performance.spectacle.name
                inputs[:date] = performance.date_performance
                inputs[:average_price] = average_price.round(2)
                data << inputs
            end
        data
    end
end
