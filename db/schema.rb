# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_03_16_001759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "bodywork", ["motorcycle", "car", "van", "truck"]
  create_enum "internship", ["processing", "finished"]
  create_enum "kind", ["delivery", "dispatch"]
  create_enum "status", ["active", "inactive"]
  create_enum "warehouse", ["high-tech", "healthcare"]

  create_table "customers", force: :cascade do |t|
    t.string "description"
    t.enum "status", default: "active", null: false, enum_type: "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "document"
    t.string "shipping_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.bigint "vehicle_id", null: false
    t.bigint "customer_id", null: false
    t.string "invoice_number"
    t.string "cargo_checker"
    t.string "dock"
    t.enum "kind", null: false, enum_type: "kind"
    t.enum "warehouse", null: false, enum_type: "warehouse"
    t.enum "internship", null: false, enum_type: "internship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_shipments_on_customer_id"
    t.index ["driver_id"], name: "index_shipments_on_driver_id"
    t.index ["vehicle_id"], name: "index_shipments_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "manufacturer"
    t.string "sample"
    t.string "license_plate"
    t.enum "bodywork", null: false, enum_type: "bodywork"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "shipments", "customers"
  add_foreign_key "shipments", "drivers"
  add_foreign_key "shipments", "vehicles"
end
