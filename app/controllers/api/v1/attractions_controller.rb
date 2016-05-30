class Api::V1::AttractionsController < ApplicationController
	before_filter :get_place, :only => [:index]
	def index
		@attractions = @place.attractions
	end
	private
	def get_place
		@place = Place.find_by_id(params[:id])
	end
end
