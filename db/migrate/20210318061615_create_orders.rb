class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.date :desired_delivery_date
      t.string :delivery_name
      t.string :shipping_address
      t.integer :payment_method
      t.integer :billing_amount
      t.integer :shipping_cost
      t.string :postal_code
      t.integer :received_status

      t.timestamps
    end
  end
end
