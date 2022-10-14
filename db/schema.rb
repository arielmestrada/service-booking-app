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

ActiveRecord::Schema[7.0].define(version: 2022_10_14_043700) do
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

  create_table "addons", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["service_id"], name: "index_addons_on_service_id"
  end

  create_table "booking_numbers", force: :cascade do |t|
    t.bigint "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_booking_numbers_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "booking_number"
    t.datetime "date_booked"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.bigint "contact_number"
    t.string "street"
    t.string "village"
    t.string "city"
    t.string "province"
    t.bigint "postal_code"
    t.string "service_name"
    t.float "service_price"
    t.date "scheduled_date"
    t.time "scheduled_time"
    t.text "addon_names", default: [], array: true
    t.text "addon_prices", default: [], array: true
    t.float "amount"
    t.string "status", default: "carted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_options", force: :cascade do |t|
    t.bigint "card_number"
    t.string "card_type"
    t.date "expiry_date"
    t.string "registered_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_payment_options_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "available_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["service_id"], name: "index_schedules_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_services_on_category_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.time "available_time"
    t.bigint "slots"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "schedule_id"
    t.string "time_string"
    t.index ["schedule_id"], name: "index_timeslots_on_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "contact_number"
    t.string "street"
    t.string "village"
    t.string "city"
    t.string "province"
    t.bigint "postal_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addons", "services"
  add_foreign_key "booking_numbers", "users"
  add_foreign_key "payment_options", "users"
  add_foreign_key "schedules", "services"
  add_foreign_key "services", "categories"
  add_foreign_key "timeslots", "schedules"
end
