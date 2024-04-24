class ReportReservation < ApplicationRecord
  belongs_to :reservation
  belongs_to :report
end
