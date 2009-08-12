class Ticket < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :seat_id
	validates_presence_of :address
	validates_presence_of :price
	validates_presence_of :email
	validates_numericality_of :price
end
