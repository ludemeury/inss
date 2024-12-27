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

ActiveRecord::Schema[8.0].define(version: 2024_12_27_183152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.integer "number"
    t.string "complement"
    t.string "district"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "proponent_contacts", force: :cascade do |t|
    t.string "value"
    t.string "kind"
    t.bigint "proponent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proponent_id"], name: "index_proponent_contacts_on_proponent_id"
  end

  create_table "proponent_documents", force: :cascade do |t|
    t.string "document"
    t.string "kind"
    t.bigint "proponent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proponent_id"], name: "index_proponent_documents_on_proponent_id"
  end

  create_table "proponents", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.decimal "income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "inss_discount"
  end

  add_foreign_key "proponent_contacts", "proponents"
  add_foreign_key "proponent_documents", "proponents"
end
