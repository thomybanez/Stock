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

ActiveRecord::Schema[7.0].define(version: 2023_04_26_114320) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "positions", force: :cascade do |t|
    t.integer "user_id"
    t.string "coin_id"
    t.decimal "quantity"
    t.decimal "average_entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.decimal "entry_price"
    t.decimal "exit_price"
    t.string "coin_id"
    t.decimal "size", default: "0.0"
    t.boolean "is_going", default: true
    t.decimal "quantity"
    t.decimal "average_entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "position_id", default: 1, null: false
    t.index ["position_id"], name: "index_trades_on_position_id"
    t.index ["user_id"], name: "index_trades_on_user_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.string "transaction_type"
    t.decimal "amount"
    t.integer "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.boolean "is_verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "verification_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["verification_token"], name: "index_users_on_verification_token"
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "balance", default: "0.0"
    t.integer "user_id"
    t.string "transaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "trades", "positions"
  add_foreign_key "trades", "users"
end
