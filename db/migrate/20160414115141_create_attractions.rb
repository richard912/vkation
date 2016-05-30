class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
    	 t.string :name, null: false, default: ""
         t.string :activity_type    , null: false, default: ""
    	 t.text :about	, null: false, default: ""
    	 t.string :latitude	, null: false, default: ""
    	 t.string :longitude 	, null: false, default: ""
    	 t.text :duration	, null: false, default: ""
    	 t.string :price	, null: false, default: ""
    	 t.string :visit_time	, null: false, default: ""
    	 t.text :things_to_carry, null: false, default: ""
    	 t.string :trip_advisor_rating	, null: false, default: ""
    	 t.string :our_rating	, null: false, default: ""
    	 t.text :inclusions, null: false, default: ""
         t.text :image_link, null: false, default: ""
    	 t.timestamps null: false
    end
    	 add_reference :attractions, :place, index: true
  end
end
