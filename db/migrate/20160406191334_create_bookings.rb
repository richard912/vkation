class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :guest_count, default: 1, null: false
      t.integer :hotel_id , default: 1, null: false
      t.integer :total , default: 0, null: false
      t.text  :hotel_name , default: 0, null: false
      t.references :place
      t.references :budget
      t.references :stay_type
      t.references :user
      t.timestamps null: false
    end
  end
end
