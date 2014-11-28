class CreateCustomersTags < ActiveRecord::Migration
  def change
    create_table :customers_tags, id: false do |t|
      t.integer :customer_id
      t.integer :tag_id
    end
    add_index :customers_tags, [:customer_id, :tag_id]
  end
end