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

ActiveRecord::Schema.define(version: 2018_11_28_105017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kabupatens", force: :cascade do |t|
    t.bigint "province_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_kabupatens_on_province_id"
  end

  create_table "kecamatans", force: :cascade do |t|
    t.bigint "kabupaten_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kabupaten_id"], name: "index_kecamatans_on_kabupaten_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "kecamatan_id"
    t.bigint "product_type_id"
    t.string "name"
    t.string "image", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kecamatan_id"], name: "index_products_on_kecamatan_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "kabupatens", "provinces"
  add_foreign_key "kecamatans", "kabupatens"
  add_foreign_key "products", "kecamatans"
  add_foreign_key "products", "product_types"
end
