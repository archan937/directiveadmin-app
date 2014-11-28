class CreateProductLines < ActiveRecord::Migration
  def change
    create_table :product_lines do |t|
      t.string :name,        limit: 50
      t.string :description, limit: 4000
    end
  end
end
