class Transport < ActiveRecord::Base
	has_many :booking_transports
	has_many :bookings, :through => :booking_transports
end
