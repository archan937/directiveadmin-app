class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_line_id
      t.string  :code,   limit: 15
      t.string  :name,   limit: 70
      t.string  :scale,  limit: 10
      t.string  :vendor, limit: 50
      t.text    :description
      t.integer :quantity_in_stock, limit: 2
      t.decimal :price, precision: 10, scale: 2
      t.decimal :msrp,  precision: 10, scale: 2
    end
    add_index :products, :product_line_id
  end
end