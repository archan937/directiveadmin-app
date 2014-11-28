class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :city,          limit: 50
      t.string :phone,         limit: 50
      t.string :address_line1, limit: 50
      t.string :address_line2, limit: 50
      t.string :postal_code,   limit: 15
      t.string :state,         limit: 50
      t.string :country,       limit: 50
      t.string :territory,     limit: 10
    end
  end
end
