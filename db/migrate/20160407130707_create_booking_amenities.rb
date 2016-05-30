class CreateBookingAmenities < ActiveRecord::Migration
  def change
    create_table :booking_amenities do |t|
      t.references :booking
      t.references :amenity
      t.timestamps null: false
    end
  end
end
