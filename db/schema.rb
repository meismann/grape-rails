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

ActiveRecord::Schema.define(version: 2019_11_29_114730) do

  create_table "addresses", force: :cascade do |t|
    t.string "sageone_guid", limit: 32
    t.string "street", limit: 255
    t.string "postcode", limit: 16
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["sageone_guid"], name: "index_addresses_on_sageone_guid"
  end

  create_table "artefact_line_items", force: :cascade do |t|
    t.string "sageone_guid", limit: 32
    t.string "name", limit: 255
    t.decimal "quantity"
    t.decimal "net_amount"
    t.integer "artefact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artefact_id"], name: "index_artefact_line_items_on_artefact_id"
    t.index ["sageone_guid"], name: "index_artefact_line_items_on_sageone_guid"
  end

  create_table "artefacts", force: :cascade do |t|
    t.string "sageone_guid", limit: 32
    t.date "date"
    t.string "reference"
    t.decimal "total"
    t.boolean "issued"
    t.integer "contact_id"
    t.integer "main_address_id"
    t.integer "delivery_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_artefacts_on_contact_id"
    t.index ["delivery_address_id"], name: "index_artefacts_on_delivery_address_id"
    t.index ["main_address_id"], name: "index_artefacts_on_main_address_id"
    t.index ["sageone_guid"], name: "index_artefacts_on_sageone_guid"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "sageone_guid", limit: 32
    t.string "firstname", limit: 255
    t.string "lastname", limit: 127
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_contacts_on_address_id"
    t.index ["sageone_guid"], name: "index_contacts_on_sageone_guid"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_countries_on_code"
  end

end
