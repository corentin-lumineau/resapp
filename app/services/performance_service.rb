# This service finds or creates a Performance object if the performance_token passed in argument is not present in the database.
# Returns a performance instance.
class PerformanceService
    def initialize(**args)
        @token = args[:row]["Cle representation"]
        @date_start = args[:row]["Date representation"]
        @date_end = args[:row]["Date fin representation"]
        @hour_start = args[:row]["Heure representation"]
        @hour_end = args[:row]["Heure fin representation"]
        @spectacle = args[:spectacle]
    end

    def create_or_find
        performance = Performance.find_or_initialize_by(performance_token: @token)
        unless performance.persisted?
            performance.performance_token = @token
            performance.date_performance = @date_start
            performance.date_end_performance = @date_end
            performance.start_hour_performance = @hour_start
            performance.end_hour_performance = @hour_end
            performance.spectacle = @spectacle
            
            performance.save!
        end
        performance
    end
end