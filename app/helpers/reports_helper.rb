module ReportsHelper
    def format_date(datetime_string)
        datetime_string.strftime("%d/%m/%y")
    end
end
