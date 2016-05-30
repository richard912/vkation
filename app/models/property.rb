class Property
    def self.load_from_xml(xml)
        xml_parser = Nokogiri::XML(xml)
        status = xml_parser.at_css("ReturnStatus Success").content
        properties = Array.new
        if status == "true"
            prop_nodes = xml_parser.css("PropertyResult")
            prop_nodes.each do |p|
                properties << Property.new(p)
            end
        end
        properties
    end
    def initialize(node)
        @id = node.at_css("PropertyID").content
        @name = node.at_css("PropertyName").content
        @rating = node.at_css("Rating").content
        @our_rating = node.at_css("OurRating").content
        @country = node.at_css("Country").content
        @region = node.at_css("Region").content
        @resort = node.at_css("Resort").content
        @description = node.at_css("Description").content
        @base_url = node.at_css("CMSBaseURL").content
        @sub_total = 100000000000000
        @discount = 100000000000000
        @total = 100000000000000
        @priority = false
        room_types = node.css("RoomType")
        room_types.each do |room_type|
            sub_total = room_type.at_css("SubTotal") ? room_type.at_css("SubTotal").content.to_f : 0
            discount = room_type.at_css("Discount") ? room_type.at_css("Discount").content.to_f : 0
            total = room_type.at_css("Total") ? room_type.at_css("Total").content.to_f : 0
            puts "sub_total", room_type.at_css("SubTotal")
            puts "discount", room_type.at_css("Discount")
            puts "total", room_type.at_css("Total")
            if total < @total && total > 0
                @sub_total = sub_total
                @discount = discount
                @total = total
            end
        end
        @image = node.at_css("MainImage").content
        @image_thumbnail = node.at_css("MainImageThumbnail").content
        @match_count = 0
        detail = HotelDetail.find_by_property_id(@id)
        if detail
            @latitude = detail.latitude
            @longitude = detail.longitude
            @facilities = detail.facilities
        end
    end
    def id
        @id
    end
    def name
        @name
    end
    def rating
        @rating
    end
    def our_rating
        @our_rating
    end
    def country
        @country
    end
    def region
        @region
    end
    def resort
        @resort
    end
    def description
        @description
    end
    def latitude
        @latitude
    end
    def longitude
        @longitude
    end
    def facilities
        if @facilities
            @facilities.split(",")
        end
    end
    def match_count
        @match_count
    end
    def match_count=(value)
      @match_count = value
    end
    def sub_total
        @sub_total
    end
    def discount
        @discount
    end
    def total
        @total
    end
    def image
        @base_url + @image
    end
    def image_thumbnail
        @base_url + @image_thumbnail
    end
    def priority
        @priority
    end
    def priority=(value)
        @priority = value
    end
    def to_json
        {
            id: @id,
            name: @name,
            rating: @rating,
            our_rating: @our_rating,
            country: @country,
            region: @region,
            resort: @resort,
            description: @description,
            image: image(),
            image_thumbnail: image_thumbnail(),
            facilities: @facilities
        }
    end
end