class Amenity < ActiveRecord::Base
	has_many :booking_amenities
	has_many :bookings, :through => :booking_amenities
end
