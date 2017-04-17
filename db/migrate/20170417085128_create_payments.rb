class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.decimal :amount
      t.string :description
      t.timestamps
    end
  end
end
