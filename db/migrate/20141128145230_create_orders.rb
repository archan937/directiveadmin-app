class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.date    :order_date
      t.date    :required_date
      t.date    :shipped_date
      t.string  :status, limit: 15
      t.text    :comments
    end
    add_index :orders, :customer_id
  end
end