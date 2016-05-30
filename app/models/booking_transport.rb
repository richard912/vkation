class BookingTransport < ActiveRecord::Base
	belongs_to :booking
	belongs_to :transport
end
