class CreateBookingAttractions < ActiveRecord::Migration
  def change
    create_table :booking_attractions do |t|
 	  t.references :booking
      t.references :attraction
      t.timestamps null: false
    end
  end
end