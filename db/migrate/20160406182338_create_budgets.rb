class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :start_range, default: 0, null: false
      t.integer :end_range, default: 0, null: false
      t.timestamps null: false
    end
  end
end
