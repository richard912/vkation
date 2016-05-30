class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :name, null: false, default: ""
      t.string :image_link, null: false, default: ""

      t.timestamps null: false
    end
  end
end
