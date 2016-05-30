class Api::V1::PlacesController < Api::V1::BaseController
	def index
		HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
		@places = Place.all
	end
end
