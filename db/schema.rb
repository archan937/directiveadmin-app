# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141128234026) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "customers", force: true do |t|
    t.integer "sales_rep_employee_id"
    t.string  "name",                  limit: 50
    t.string  "contact_first_name",    limit: 50
    t.string  "contact_last_name",     limit: 50
    t.string  "phone",                 limit: 50
    t.string  "address_line1",         limit: 50
    t.string  "address_line2",         limit: 50
    t.string  "postal_code",           limit: 15
    t.string  "city",                  limit: 50
    t.string  "state",                 limit: 50
    t.string  "country",               limit: 50
    t.decimal "credit_limit",                     precision: 10, scale: 2
  end

  add_index "customers", ["sales_rep_employee_id"], name: "index_customers_on_sales_rep_employee_id", using: :btree

  create_table "customers_tags", id: false, force: true do |t|
    t.integer "customer_id"
    t.integer "tag_id"
  end

  add_index "customers_tags", ["customer_id", "tag_id"], name: "index_customers_tags_on_customer_id_and_tag_id", using: :btree

  create_table "employees", force: true do |t|
    t.integer "office_id"
    t.integer "reportee_id"
    t.string  "job_title",   limit: 50
    t.string  "first_name",  limit: 50
    t.string  "last_name",   limit: 50
    t.string  "email",       limit: 100
  end

  add_index "employees", ["office_id"], name: "index_employees_on_office_id", using: :btree
  add_index "employees", ["reportee_id"], name: "index_employees_on_reportee_id", using: :btree

  create_table "offices", force: true do |t|
    t.string "city",          limit: 50
    t.string "phone",         limit: 50
    t.string "address_line1", limit: 50
    t.string "address_line2", limit: 50
    t.string "postal_code",   limit: 15
    t.string "state",         limit: 50
    t.string "country",       limit: 50
    t.string "territory",     limit: 10
  end

  create_table "order_details", force: true do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "order_line_number", limit: 2
    t.integer "quantity_ordered"
    t.decimal "price_each",                  precision: 10, scale: 2
  end

  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id", using: :btree
  add_index "order_details", ["product_id"], name: "index_order_details_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer "customer_id"
    t.date    "order_date"
    t.date    "required_date"
    t.date    "shipped_date"
    t.string  "status",        limit: 15
    t.text    "comments"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "payments", force: true do |t|
    t.integer "customer_id"
    t.string  "check_number", limit: 50
    t.date    "date"
    t.decimal "amount",                  precision: 10, scale: 2
  end

  add_index "payments", ["customer_id"], name: "index_payments_on_customer_id", using: :btree

  create_table "product_lines", force: true do |t|
    t.string "name",        limit: 50
    t.string "description", limit: 4000
  end

  create_table "products", force: true do |t|
    t.integer "product_line_id"
    t.string  "code",              limit: 15
    t.string  "name",              limit: 70
    t.string  "scale",             limit: 10
    t.string  "vendor",            limit: 50
    t.text    "description"
    t.integer "quantity_in_stock", limit: 2
    t.decimal "price",                        precision: 10, scale: 2
    t.decimal "msrp",                         precision: 10, scale: 2
  end

  add_index "products", ["product_line_id"], name: "index_products_on_product_line_id", using: :btree

  create_table "tags", force: true do |t|
    t.string "name", limit: 50
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
