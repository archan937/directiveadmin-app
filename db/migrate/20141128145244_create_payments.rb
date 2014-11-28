class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :customer_id
      t.string  :check_number, limit: 50
      t.date    :date
      t.decimal :amount, precision: 10, scale: 2
    end
    add_index :payments, :customer_id
  end
end