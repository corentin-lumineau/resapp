class ReportBuyer < ApplicationRecord
  belongs_to :buyer
  belongs_to :report
end
