class AddOtherFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    ## User profile fields
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string

    ## Address fields
    add_column :users, :shipping_address, :string
    add_column :users, :billing_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postal_code, :string
    add_column :users, :country, :string

    ## Role field
    add_column :users, :role, :integer, default: 0, null: false
  end
end
