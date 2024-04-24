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

ActiveRecord::Schema[7.0].define(version: 2024_04_24_154901) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.index ["email"], name: "index_buyers_on_email", unique: true
  end

  create_table "performances", force: :cascade do |t|
    t.datetime "date_performance"
    t.time "start_hour_performance"
    t.time "end_hour_performance"
    t.bigint "spectacle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "performance_token"
    t.datetime "date_end_performance"
    t.index ["performance_token"], name: "index_performances_on_performance_token", unique: true
    t.index ["spectacle_id"], name: "index_performances_on_spectacle_id"
  end

  create_table "report_buyers", force: :cascade do |t|
    t.bigint "buyer_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_report_buyers_on_buyer_id"
    t.index ["report_id"], name: "index_report_buyers_on_report_id"
  end

  create_table "report_performances", force: :cascade do |t|
    t.bigint "performance_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_id"], name: "index_report_performances_on_performance_id"
    t.index ["report_id"], name: "index_report_performances_on_report_id"
  end

  create_table "report_reservations", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_reservations_on_report_id"
    t.index ["reservation_id"], name: "index_report_reservations_on_reservation_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "performances", "spectacles"
  add_foreign_key "report_buyers", "buyers"
  add_foreign_key "report_buyers", "reports"
  add_foreign_key "report_performances", "performances"
  add_foreign_key "report_performances", "reports"
  add_foreign_key "report_reservations", "reports"
  add_foreign_key "report_reservations", "reservations"
  add_foreign_key "reservations", "buyers"
  add_foreign_key "tickets", "performances"
  add_foreign_key "tickets", "reservations"
end
