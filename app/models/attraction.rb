class Attraction < ActiveRecord::Base
	belongs_to :place
	has_many :attraction_reviews
	has_many :booking_attractions
	has_many :bookings, :through => :booking_attractions

	def calculate_distance(hotel_lat, hotel_lng)
		 	hotel_lat_lng = Geokit::LatLng.new(hotel_lat, hotel_lng)
		 	attraction_lat_lng = Geokit::LatLng.new(self.latitude,self.longitude)
		 	distance = hotel_lat_lng.distance_to(attraction_lat_lng, :units => :kms)
		 	distance.round(2)
	end
end
