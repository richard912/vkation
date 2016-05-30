class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
	    t.string   :name,           default: "", null: false
	    t.string   :transport_type, default: "", null: false
	    t.integer  :price,          default: 0,  null: false
	    t.integer  :hours,          default: 0,  null: false
	    t.datetime :created_at,                  null: false
	    t.datetime :updated_at,                  null: false
      	t.timestamps null: false
    end
  end
end
