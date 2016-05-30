class AttractionReview < ActiveRecord::Base
	belongs_to :attraction
	belongs_to :user
end
