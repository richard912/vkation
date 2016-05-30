class Api::V1::TransportsController < Api::V1::BaseController
	def index 
		@transports = Transport.all
	end
end
