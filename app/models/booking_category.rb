class BookingCategory < ActiveRecord::Base
	belongs_to :category
	belongs_to :booking
end
