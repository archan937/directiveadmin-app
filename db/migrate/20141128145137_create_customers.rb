class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :sales_rep_employee_id
      t.string  :name,               limit: 50
      t.string  :contact_first_name, limit: 50
      t.string  :contact_last_name,  limit: 50
      t.string  :phone,              limit: 50
      t.string  :address_line1,      limit: 50
      t.string  :address_line2,      limit: 50
      t.string  :postal_code,        limit: 15
      t.string  :city,               limit: 50
      t.string  :state,              limit: 50
      t.string  :country,            limit: 50
      t.decimal :credit_limit, precision: 10, scale: 2
    end
    add_index :customers, :sales_rep_employee_id
  end
end