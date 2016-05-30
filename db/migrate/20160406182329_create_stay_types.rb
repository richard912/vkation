class CreateStayTypes < ActiveRecord::Migration
  def change
    create_table :stay_types do |t|
   	  t.string :name, null: false, default: ""
      t.timestamps null: false
    end
  end
end
