class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :office_id
      t.integer :reportee_id
      t.string  :job_title,  limit: 50
      t.string  :first_name, limit: 50
      t.string  :last_name,  limit: 50
      t.string  :email,      limit: 100
    end
    add_index :employees, :office_id
    add_index :employees, :reportee_id
  end
end
