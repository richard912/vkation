class Category < ActiveRecord::Base
	has_many :booking_categories
	has_many :bookings, :through => :booking_categories

	has_many :category_activities
	has_many :activities, :through => :category_activities

	def get_image_link
		file = File.read("#{Rails.root}/app/assets/images/"+ image_link.split('/').last)
		return Base64.encode64(file)
	end

	def get_aminities
	    amenities.split(",").map(&:upcase)
	end

	def self.get_all_amenities
		uniq_amenity = []
		all_amenities = self.all.collect {|p| p.amenities}
		all_amenities.each do |amenity|
			split_amenities = amenity.split(',')
			split_amenities.each do |single_amenity|
				hash = {:name => single_amenity}
				uniq_amenity << hash
			end
		end
		uniq_amenity.uniq
	end

end
