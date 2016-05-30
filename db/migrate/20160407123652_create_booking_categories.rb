class CreateBookingCategories < ActiveRecord::Migration
  def change
    create_table :booking_categories do |t|
      t.references :booking
      t.references :category
      t.timestamps null: false
    end
  end
end
