class BookingAmenity < ActiveRecord::Base
	belongs_to :amenity
	belongs_to :booking
end
