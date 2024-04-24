# This service explores the file in input and calls the ColumnScrapperService to handle the data of each row.
# Returns a hash containing the id of the linked objects.  
require 'csv'

class ReportsGeneratorService
    def initialize(file)
        @file_path = file.tempfile.path
    end

    def perform
        # Creation of a hash to store the attributes to return.
        report_attributes = {
            reservations: [],
            buyers: [],
            performances: []
        }

        # Iteration on each ligne of the csv file to manage each row and get the data to store into report_attributes hash.
        CSV.foreach(@file_path, headers: true, col_sep: ";") do |row|
            data = process_row(row)
            report_attributes[:reservations] << data[:reservation]
            report_attributes[:buyers] << data[:buyer]
            report_attributes[:performances] << data[:performance]
        end
        
        return report_attributes
        
    end

    private

    # Instanciates the ColumnScrapperService with the data stores in the row and a specific service to manage each data type.
    # Returns a hash containing the id for the Reservation, Performance and buyer objects.
    def process_row(row)
        result = {}
        
        ActiveRecord::Base.transaction do
            spectacle = ColumnScrapperService.new(row: row, klass: SpectacleService).create_or_find
            buyer = ColumnScrapperService.new(row: row, klass: BuyerService).create_or_find
            performance = ColumnScrapperService.new(row: row, klass: PerformanceService, spectacle: spectacle).create_or_find
            reservation = ColumnScrapperService.new(row: row, klass: ReservationService, buyer: buyer ).create_or_find
            ColumnScrapperService.new(row: row, klass: TicketService, reservation: reservation, performance: performance).create_or_find

            result[:reservation] = reservation.id
            result[:performance] = performance.id
            result[:buyer] = buyer.id
        end
        return result
    end
end