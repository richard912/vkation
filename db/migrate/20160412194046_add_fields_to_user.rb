class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :int
    add_column :users, :marital_status, :bool
    add_column :users, :gender, :bool
    add_column :users, :profession, :string
    add_column :users, :minutes_spent, :int
    add_column :users, :visited_pages, :int
  end
end
