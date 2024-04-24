class ReportsController < ApplicationController

    def index
        @reports = Report.all
    end

    def new
        @report = Report.new
    end

    def show
        @report = Report.find(params[:id])
    end

    
    def create
        # Instanciation of a FileProcessorService to check if the input file is a csv.
        file_processor = FileProcessorService.new
        if file_processor.process_csv_file(report_params["file"].tempfile.path)
            # Instanciation of a new Report object with default name set to the filename.
            @report = Report.new(name: report_params["file"].original_filename)
            # Call of the ReportGeneratorService to manage the scrapping of the file and get the attributes of the Report object.
            report_attributes = ReportsGeneratorService.new(report_params["file"]).perform
            # Attribute's assignement to the Report object.
            @report.reservations = Reservation.where(id: report_attributes[:reservations])
            @report.buyers = Buyer.where(id: report_attributes[:buyers])
            @report.performances = Performance.where(id: report_attributes[:performances])
            
            @report.save!

            redirect_to report_path(@report)
        else
            redirect_to root_path, alert: "This file is not a csv"
        end
    end

    private

    def report_params
        params.require(:report).permit(:file)
    end

end
