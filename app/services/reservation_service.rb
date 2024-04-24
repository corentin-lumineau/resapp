# This service finds or creates a Reservation object if the reservation_token passed in argument is not present in the database.
# Returns a Reservation instance.
class ReservationService
    def initialize(**args)
        @token = args[:row]["Reservation"]
        @date= args[:row]["Date reservation"]
        @hour = args[:row]["Heure reservation"]
        @buyer = args[:buyer]
    end

    def create_or_find
        reservation = Reservation.find_or_initialize_by(reservation_token: @token)
        unless reservation.persisted?
            reservation.reservation_token = @token
            reservation.date_reservation = @date
            reservation.hour_reservation = @hour
            reservation.buyer = @buyer
            
            reservation.save!
        end
        reservation
    end
end