class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name, null: false, default: ""
      t.timestamps null: false
    end
  end
end
