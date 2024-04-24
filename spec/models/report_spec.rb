require 'rails_helper'

RSpec.describe Report, type: :model do
    context 'report creation' do
        it "should persist a report" do
            Report.create(name: 'test')
            expect(Report.count).to eq(1)
        end
    end

    context 'get the average age on a report' do
        let(:report) { Report.create!(name: 'test') }

        it "should return an integer with the right average age" do

           buyer1 = Buyer.create!(last_name: "Doe", first_name: "John", email:"johndoe@gmail.com", age: 30)
           buyer2 = Buyer.create!(last_name: "Dupont", first_name: "Irene", email:"irenedupont@gmail.com", age: 48)

           report.buyers << buyer1
           report.buyers << buyer2

           average_age = report.get_report_average_age

           expected_average_age = (buyer1.age + buyer2.age) / 2.0

           expect(average_age).to be_a(Integer)
           expect(average_age.round).to eq(expected_average_age)
        end
    end

    context "get the average cost by performance in a report" do
        let(:report) { Report.create!(name: 'test') }
        let(:spectacle) { Spectacle.create!(name: "Spectacle 1") }

        it "should return an array with hashes inside containing the key :average_price" do

            buyer1 = Buyer.create!(last_name: "Doe", first_name: "John", email:"johndoe@gmail.com", age: 30)
            buyer2 = Buyer.create!(last_name: "Dupont", first_name: "Irene", email:"irenedupont@gmail.com", age: 48)

            reservation = Reservation.create!(date_reservation: DateTime.new(2024, 4, 27, 12, 0, 0), hour_reservation: Time.new(2024, 4, 27, 12, 0, 0), buyer: buyer1)

            performance = Performance.create!(
                date_performance: DateTime.new(2024, 4, 30, 12, 0, 0), 
                start_hour_performance: Time.new(2024, 4, 30, 12, 0, 0), 
                end_hour_performance: Time.new(2024, 4, 30, 12, 0, 0),
                spectacle: spectacle
                )
          

            ticket1 = Ticket.create!(price: 20, product_type: "place indivicuel", sales_channel: "Abonnement", performance: performance, reservation: reservation)
            ticket2 = Ticket.create!(price: 18, product_type: "place indivicuel", sales_channel: "Abonnement", performance: performance, reservation: reservation)
            ticket3 = Ticket.create!(price: 5, product_type: "place indivicuel", sales_channel: "Abonnement", performance: performance, reservation: reservation)
        

            performance.tickets.concat([ticket1, ticket2, ticket3])
            report.buyers << buyer1
            report.performances << performance
 
            average_cost_by_performance = report.get_report_average_performance_cost
            expected_average_cost_by_performance = ((ticket1.price + ticket2.price + ticket3.price) / 3.0).round(2)
          
 
            expect(average_cost_by_performance).to be_a(Array)
            expect(average_cost_by_performance[0][:average_price].round(2)).to eq(expected_average_cost_by_performance)
         end
    end
end