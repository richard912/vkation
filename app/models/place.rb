class Place < ActiveRecord::Base
	has_many :booking
	has_many :attractions
end
