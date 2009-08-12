class Flight < ActiveRecord::Base
	validates_presence_of :destination
	validates_numericality_of :baggage_allowance
	validates_numericality_of :capacity
	has_many :seats
end
