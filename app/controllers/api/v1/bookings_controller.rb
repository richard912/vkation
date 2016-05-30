class Api::V1::BookingsController < Api::V1::BaseController
	# before_filter :is_authenticated
	def create
		@booking = Booking.create!(:start_date => params[:booking][:startDate], 
			:end_date => params[:booking][:endDate], 
			:guest_count => params[:booking][:guest_count],
			:user_id => params[:booking][:user_id],
			:place_id => params[:booking][:place_id],
			:budget_id => params[:booking][:budget_id],
			:stay_type_id => params[:booking][:stay_type_id],
			:hotel_id => params[:booking][:hotelInfo][:id],
			:hotel_name => params[:booking][:hotelInfo][:name],
			:total => params[:booking][:hotelInfo][:total]
			)
		@booking.set_attractions(params[:booking][:attractions]) unless params[:booking][:attractions].nil?
        @booking.set_transports(params[:booking][:transports]) unless params[:booking][:transports].nil?
		BookingMailer.send_booking_details_to_admin(@booking).deliver_now
		BookingMailer.send_booking_details(@booking).deliver_now
		render :json => {
			:succsess => true,
		}
	end
	private
	def booking_params
		params.require(:booking).permit!
	end
end
