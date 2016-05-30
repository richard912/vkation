class CreateHotelDetails < ActiveRecord::Migration
  def change
    create_table :hotel_details do |t|
      t.string :property_id, null: false
      t.decimal :latitude, { :precision=>10, :scale=>6 }
      t.decimal :longitude, { :precision=>10, :scale=>6 }
      t.text :facilities, null: true
      t.timestamps null: false
    end
  end
end
