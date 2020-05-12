class AddNewFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :location, :string
    add_column :users, :bio, :text
    add_column :users, :art, :string
    add_column :users, :type, :string
    add_column :users, :available, :boolean
    add_column :users, :entity, :boolean, null: false, default: false
  end
end
