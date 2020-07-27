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

ActiveRecord::Schema.define(version: 2020_07_27_151140) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.text "location"
    t.integer "Service_tech_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Service_tech_id"], name: "index_clients_on_Service_tech_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "service_technician_id", null: false
    t.integer "client_id", null: false
    t.integer "service_id", null: false
    t.text "location"
    t.string "duration"
    t.text "notes"
    t.datetime "scheduled_for?"
    t.boolean "completed?", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_jobs_on_client_id"
    t.index ["service_id"], name: "index_jobs_on_service_id"
    t.index ["service_technician_id"], name: "index_jobs_on_service_technician_id"
  end

  create_table "service_technicians", force: :cascade do |t|
    t.string "name"
    t.string "services"
    t.integer "User_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["User_id"], name: "index_service_technicians_on_User_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "business_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "clients", "Service_teches"
  add_foreign_key "jobs", "clients"
  add_foreign_key "jobs", "service_technicians"
  add_foreign_key "jobs", "services"
  add_foreign_key "service_technicians", "Users"
end
