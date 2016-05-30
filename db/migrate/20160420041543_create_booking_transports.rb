class CreateBookingTransports < ActiveRecord::Migration
  def change
    create_table :booking_transports do |t|
      t.string :selected_date, default: ""
 	  t.references :booking
      t.references :transport
      t.timestamps null: false
    end
  end
end
