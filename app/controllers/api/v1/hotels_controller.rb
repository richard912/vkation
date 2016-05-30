class Api::V1::HotelsController < Api::V1::BaseController
	def search
	    place = Place.find(search_params[:place_id])
	    budget = Budget.find(search_params[:budget_id])
	    min_price_without_deviation = budget.start_range
	    max_price_without_deviation = budget.end_range
	    min_price = budget.start_range - (budget.start_range * 0.20)
        max_price = budget.end_range + (budget.end_range * 0.20)
        matches = []
	    xml_response = XmlBookingGateway.search({
            place: place.name,
            check_in_date: search_params[:check_in_date],
            check_out_date: search_params[:check_out_date],
            number_of_guests: search_params[:number_of_guests],
            min_price: min_price,
            max_price: max_price,
		})
		@properties = Property.load_from_xml(xml_response)
		categories = params[:categories]
		@properties.each do |p|
		    facilities = p.facilities
		    categories.each do |c|
		        category = Category.find_by_id(c[:category_id])
		        aminities = category.get_aminities
		        matches = facilities & aminities
		        unless matches == false
                    p.match_count = p.match_count + 1
                else
                    p.match_count
		        end
		    end
		end
		@properties = @properties.sort_by { |k| - k.match_count }

		found = false 

		@properties.each do |prop|
			check_price_range = prop.total.between? min_price_without_deviation, max_price_without_deviation
			if check_price_range 
				prop.priority = true
				found = true
			end
		end
		if !found
			last = 0
			@properties.each do |prop|
				if (prop.match_count > 0 && prop.match_count >= last)
					prop.priority = true 
				end
				last = prop.match_count 
			end
		end
	end
	def show
        property_id = params[:id]
        xml_response = XmlBookingGateway.property_detail(property_id)
        render :json => Hash.from_xml(xml_response)
	end

	private
	def search_params
        params.require(:search).permit(
            :place_id,
            :check_in_date,
            :check_out_date,
            :number_of_guests,
            :budget_id,
            :stay_type)
    end

end
