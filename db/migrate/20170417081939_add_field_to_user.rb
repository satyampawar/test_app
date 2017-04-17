class AddFieldToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :img_url, :string
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  end
end
