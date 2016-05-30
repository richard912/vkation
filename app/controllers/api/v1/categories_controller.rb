class Api::V1::CategoriesController < Api::V1::BaseController
	def index
		@categories = Category.all
	end
	def get_amenities
		@amenities = Category.get_all_amenities
		render :json => {
			:amenities => @amenities
		}
	end
end