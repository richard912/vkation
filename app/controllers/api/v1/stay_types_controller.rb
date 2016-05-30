class Api::V1::StayTypesController < Api::V1::BaseController
	def index
		@types = StayType.all
	end
end
