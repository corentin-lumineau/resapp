# This service finds or creates a Ticket object if the ticket_token passed in argument is not present in the database.
# Returns a Ticket instance.
class TicketService

    def initialize(**args)
        @token = args[:row]["Numero billet"]
        @price = args[:row]["Prix"]
        @product_type = args[:row]["Type de produit"]
        @sales_channel = args[:row]["Filiere de vente"]
        @reservation = args[:reservation]
        @performance = args[:performance]
    end

    def create_or_find
        ticket = Ticket.find_or_initialize_by(ticket_token: @token)
        unless ticket.persisted?
            ticket.ticket_token = @token
            ticket.price = @price
            ticket.product_type = @product_type
            ticket.sales_channel = @sales_channel
            ticket.reservation = @reservation
            ticket.performance = @performance

            ticket.save!
        end
        ticket
    end

end