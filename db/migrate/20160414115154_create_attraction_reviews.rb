class CreateAttractionReviews < ActiveRecord::Migration
  def change
    create_table :attraction_reviews do |t|
      t.string :reviews	, null: false, default: ""
      t.string :rating, null: false, default: ""
      t.string :customer_name, null: false, default: ""
      t.timestamps null: false
    end
      add_reference :attraction_reviews, :attraction, index: true
  end
end
