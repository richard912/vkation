class Activity < ActiveRecord::Base
	has_many :category_activities
	has_many :categories, :through => :category_activities

	def get_image_link
		file = File.read("#{Rails.root}/app/assets/images/"+ image_link.split('/').last)
		return Base64.encode64(file)
	end
end
