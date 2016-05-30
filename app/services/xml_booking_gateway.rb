class XmlBookingGateway
    include HTTParty

    API_URL = 'http://gabtestxml.ivector.co.uk/xml/book.aspx'

    def self.search(params)
        xml = self.to_xml({
                LoginDetails: self.login_hash,
                SearchDetails: self.search_hash(params)
        }, 'SearchRequest')
        HTTParty.post API_URL,
            :body => { Data: xml },
            :headers => { 'Content-type' => 'application/x-www-form-urlencoded' }
    end

    def self.property_detail(property_id)
        xml = self.to_xml({
            LoginDetails: self.login_hash,
            PropertyID: property_id
        }, 'PropertyDetailsRequest')
        HTTParty.post API_URL,
            :body => { Data: xml },
            :headers => { 'Content-type' => 'application/x-www-form-urlencoded' }
    end

    private
    def self.to_xml(hash, root)
        hash.to_xml(skip_instruct: true, root: root)
    end

    def self.login_hash
        {
            Login: "GABBOOKXML",
            Password: "XMLTEST",
            AgentReference: "TL15053X",
            NationalityID: 0,
            CountryOfResidenceID: 0
        }
    end

    def self.search_hash(params)
        str_arrival_date = params[:check_in_date]
        arrival_date = DateTime.strptime(str_arrival_date, '%Y-%m-%d').to_date
        str_departure_date = params[:check_out_date]
        departure_date = DateTime.strptime(str_departure_date, '%Y-%m-%d').to_date
        duration = (departure_date - arrival_date).to_i
        {
            ArrivalDate: str_arrival_date,
            Duration: duration,
            RegionID: 4562,
            MealBasisID: 0,
            RoomRequests: self.room_hash(params[:number_of_guests]),
            MinimumPrice: params[:min_price].to_i,
            MaximumPrice: params[:max_price].to_i
        }
    end

    def self.room_hash(guest_count)
        {
            RoomRequest: {
                Adults: guest_count,
                Children: 0,
                Infants: 0
            }
        }
    end

end