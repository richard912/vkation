class BookingAttraction < ActiveRecord::Base
	belongs_to :attraction 
	belongs_to :booking
end
