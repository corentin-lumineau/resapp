# This service finds or creates a Buyer object if the email passed in argument is not present in the database.
# Returns a Buyer instance.
class BuyerService
    def initialize(**args)
        @email = args[:row]["Email"]
        @last_name = args[:row]["Nom"]
        @first_name = args[:row]["Prenom"]
        @address = args[:row]["Adresse"]
        @zip_code = args[:row]["Code postal"]
        @country = args[:row]["Pays"]
        @age = args[:row]["Age"]
        @sex = args[:row]["Sexe"]
    end

    def create_or_find
        buyer = Buyer.find_or_initialize_by(email: @email)
        unless buyer.persisted?
            buyer.email = @email
            buyer.first_name = @first_name
            buyer.last_name = @last_name
            buyer.address = @address
            buyer.zip_code = @zip_code
            buyer.country = @country
            buyer.age = @age
            buyer.sex = @sex
            
            buyer.save!
        end

        buyer
    end
end