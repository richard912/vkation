class BookingMailer < ApplicationMailer
	default from: "vkation1@gmail.com"
	def send_booking_details booking 
		@booking = booking
		email = booking.user.email
    	mail from: "vkation1@gmail.com",to: user, subject: 'Booking Details'
  	end
  	def send_booking_details_to_admin booking
  		@booking = booking
    	mail from: "vkation1@gmail.com",to: 'zeeshan@gems.techverx.com',subject: 'Booking Details'
  	end
end
