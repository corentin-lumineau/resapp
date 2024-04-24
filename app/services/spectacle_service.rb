# This service finds or creates a Spectacle object if the spectacle_token passed in argument is not present in the database.
# Returns a Spectacle instance.
class SpectacleService
    def initialize(**args)
        @spectacle_token = args[:row]["Cle spectacle"]
        @spectacle_name= args[:row]["Spectacle"]
    end

    def create_or_find
        spectacle = Spectacle.find_or_initialize_by(spectacle_token: @spectacle_token)
        unless spectacle.persisted?
            spectacle.name = @spectacle_name
            spectacle.spectacle_token = @spectacle_token
            
            spectacle.save!
        end
        spectacle
    end
end