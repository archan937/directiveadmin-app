class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :order_line_number, limit: 2
      t.integer :quantity_ordered
      t.decimal :price_each, precision: 10, scale: 2
    end
    add_index :order_details, :order_id
    add_index :order_details, :product_id
  end
end