# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_31_203030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.text "location"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "service_technician_id"
    t.bigint "client_id"
    t.bigint "service_id"
    t.bigint "user_id", null: false
    t.text "location"
    t.string "duration"
    t.text "notes"
    t.datetime "scheduled_for?"
    t.boolean "completed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "job_time_zone"
    t.index ["client_id"], name: "index_jobs_on_client_id"
    t.index ["service_id"], name: "index_jobs_on_service_id"
    t.index ["service_technician_id"], name: "index_jobs_on_service_technician_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "service_technicians", force: :cascade do |t|
    t.string "name"
    t.string "services"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_service_technicians_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "business_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "clients", "users"
  add_foreign_key "jobs", "clients"
  add_foreign_key "jobs", "service_technicians"
  add_foreign_key "jobs", "services"
  add_foreign_key "jobs", "users"
  add_foreign_key "service_technicians", "users"
  add_foreign_key "services", "users"
end
