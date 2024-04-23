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

ActiveRecord::Schema[7.0].define(version: 2024_04_23_080340) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "address"
    t.string "zip_code"
    t.string "country"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sex"
  end

  create_table "performances", force: :cascade do |t|
    t.datetime "date_performance"
    t.time "start_hour_performance"
    t.time "end_hour_performance"
    t.bigint "spectacle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "performance_token"
    t.index ["performance_token"], name: "index_performances_on_performance_token", unique: true
    t.index ["spectacle_id"], name: "index_performances_on_spectacle_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "date_reservation"
    t.time "hour_reservation"
    t.bigint "buyer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reservation_token"
    t.index ["buyer_id"], name: "index_reservations_on_buyer_id"
    t.index ["reservation_token"], name: "index_reservations_on_reservation_token", unique: true
  end

  create_table "spectacles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spectacle_token"
    t.index ["spectacle_token"], name: "index_spectacles_on_spectacle_token", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "price"
    t.string "product_type"
    t.string "sales_channel"
    t.bigint "reservation_id", null: false
    t.bigint "performance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ticket_token"
    t.index ["performance_id"], name: "index_tickets_on_performance_id"
    t.index ["reservation_id"], name: "index_tickets_on_reservation_id"
    t.index ["ticket_token"], name: "index_tickets_on_ticket_token", unique: true
  end

  add_foreign_key "performances", "spectacles"
  add_foreign_key "reservations", "buyers"
  add_foreign_key "tickets", "performances"
  add_foreign_key "tickets", "reservations"
end
