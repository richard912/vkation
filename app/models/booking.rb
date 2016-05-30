class Booking < ActiveRecord::Base

	belongs_to :user
	
	belongs_to :place
	belongs_to :stay_type
	belongs_to :budget
	belongs_to :status

	has_many :booking_categories
	has_many :categories, :through => :booking_categories

	has_many :booking_attractions
	has_many :attractions, :through => :booking_attractions

	has_many :booking_amenities
	has_many :amenities, :through => :booking_amenities

  has_many :booking_transports
  has_many :transports, :through => :booking_transports
    
    def process_razorpayment(params)
      # product = Product.find(params[:product_id])
      razorpay_pmnt_obj = fetch_payment(params[:payment_id])
      status = fetch_payment(params[:payment_id]).status
      if status == "authorized"
        razorpay_pmnt_obj.capture({amount: product.price})
        razorpay_pmnt_obj = fetch_payment(params[:payment_id])
        params.merge!({status: razorpay_pmnt_obj.status, price: product.price})
        # Order.create(params)
      else
        raise StandardError, "UNable to capture payment"
      end
    end

    def set_attractions(attractions)
      all_attractions = []
      attractions.each do |attraction|
        attr_single = Attraction.find_by_id(attraction['info']['id'])
        all_attractions << attr_single
      end
      self.attractions << all_attractions
      # self.attractions.build
    end

    def set_transports(transports)
      all_transports = []
      transports.each do |transport|
        transport_single = Transport.find_by_id(transport['info']['id'])
        all_transports << transport_single
      end
      self.transports << all_transports
      # self.transports.build
    end

end
