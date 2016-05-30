# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160420041543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "image_link", default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "amenities", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "image_link", default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "attraction_reviews", force: :cascade do |t|
    t.string   "reviews",       default: "", null: false
    t.string   "rating",        default: "", null: false
    t.string   "customer_name", default: "", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "attraction_id"
  end

  add_index "attraction_reviews", ["attraction_id"], name: "index_attraction_reviews_on_attraction_id", using: :btree

  create_table "attractions", force: :cascade do |t|
    t.string   "name",                default: "", null: false
    t.string   "activity_type",       default: "", null: false
    t.text     "about",               default: "", null: false
    t.string   "latitude",            default: "", null: false
    t.string   "longitude",           default: "", null: false
    t.text     "duration",            default: "", null: false
    t.string   "price",               default: "", null: false
    t.string   "visit_time",          default: "", null: false
    t.text     "things_to_carry",     default: "", null: false
    t.string   "trip_advisor_rating", default: "", null: false
    t.string   "our_rating",          default: "", null: false
    t.text     "inclusions",          default: "", null: false
    t.text     "image_link",          default: "", null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "place_id"
  end

  add_index "attractions", ["place_id"], name: "index_attractions_on_place_id", using: :btree

  create_table "booking_amenities", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_attractions", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "attraction_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "booking_categories", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "booking_transports", force: :cascade do |t|
    t.string   "selected_date", default: ""
    t.integer  "booking_id"
    t.integer  "transport_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "guest_count",  default: 1,   null: false
    t.integer  "hotel_id",     default: 1,   null: false
    t.integer  "total",        default: 0,   null: false
    t.text     "hotel_name",   default: "0", null: false
    t.integer  "place_id"
    t.integer  "budget_id"
    t.integer  "stay_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "budgets", force: :cascade do |t|
    t.integer  "start_range", default: 0, null: false
    t.integer  "end_range",   default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "image_link", default: "", null: false
    t.string   "amenities",  default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "category_activities", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hotel_details", force: :cascade do |t|
    t.string   "property_id",                          null: false
    t.decimal  "latitude",    precision: 10, scale: 6
    t.decimal  "longitude",   precision: 10, scale: 6
    t.text     "facilities"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "image_link", default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "stay_types", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "transports", force: :cascade do |t|
    t.string   "name",           default: "", null: false
    t.string   "transport_type", default: "", null: false
    t.integer  "price",          default: 0,  null: false
    t.integer  "hours",          default: 0,  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "phone_number",           default: "", null: false
    t.string   "api_token",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "age"
    t.boolean  "marital_status"
    t.boolean  "gender"
    t.string   "profession"
    t.integer  "minutes_spent"
    t.integer  "visited_pages"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
