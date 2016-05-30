class CreateCategoryActivities < ActiveRecord::Migration
  def change
    create_table :category_activities do |t|
      t.references :category
      t.references :activity
      t.timestamps null: false
    end
  end
end
