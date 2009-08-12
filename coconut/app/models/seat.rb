class Seat < ActiveRecord::Base
	validates_presence_of :name
	validates_numericality_of :baggage
	belongs_to :flight	
	def validate
		if baggage > Flight.find(flight_id).baggage_allowance
			errors.add_to_base("You have too much baggage!")
		end
		if flight.seats.size >= flight.capacity
			errors.add_to_base("This flight is fully booked")
		end
	end
end
