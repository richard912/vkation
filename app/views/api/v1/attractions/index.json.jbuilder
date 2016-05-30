json.attractions @attractions do |attraction| 
	json.id attraction.id
	json.name  attraction.name
    json.activity_type  attraction.activity_type
    json.about  attraction.about
    json.latitude  attraction.latitude
    json.longitude  attraction.longitude
    json.duration  attraction.duration
    json.price  attraction.price
    json.visit_time  attraction.visit_time
    json.things_to_carry  attraction.things_to_carry
    json.trip_advisor_rating  attraction.trip_advisor_rating
    json.image_link  attraction.image_link
    json.our_rating  attraction.our_rating
    json.inclusions  attraction.inclusions
    json.distance attraction.calculate_distance(params[:lat],params[:lng]) if params[:lat] and params[:lng]
    json.customer_reviews attraction.attraction_reviews do |review|
    	json.id review.id
    	json.reviews  review.reviews
	    json.rating  review.rating
	    json.customer_name  review.customer_name
	end
end