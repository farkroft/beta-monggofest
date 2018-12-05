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

ActiveRecord::Schema.define(version: 2018_12_05_072620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_invests", force: :cascade do |t|
    t.bigint "product_id"
    t.float "price"
    t.integer "slot"
    t.integer "count_view"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_invests_on_product_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.bigint "province_id"
    t.bigint "product_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["province_id"], name: "index_products_on_province_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "url"
    t.integer "sort_number"
    t.boolean "isActive", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_investors", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_invests_id"
    t.integer "investor_slot"
    t.float "investor_pay"
    t.integer "invest_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_invests_id"], name: "index_user_investors_on_product_invests_id"
    t.index ["user_id"], name: "index_user_investors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "role", default: "user", null: false
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "product_invests", "products"
  add_foreign_key "products", "product_types"
  add_foreign_key "products", "provinces"
  add_foreign_key "user_investors", "product_invests", column: "product_invests_id"
  add_foreign_key "user_investors", "users"
end
