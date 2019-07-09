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

ActiveRecord::Schema.define(version: 2019_07_04_191531) do

  create_table "labs", force: :cascade do |t|
    t.string "principal_investigator"
    t.string "institution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "lab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_locations_on_lab_id"
  end

  create_table "reagent_uses", force: :cascade do |t|
    t.integer "reagent_id"
    t.integer "user_id"
    t.string "unit"
    t.integer "quantity"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reagent_id"], name: "index_reagent_uses_on_reagent_id"
    t.index ["user_id"], name: "index_reagent_uses_on_user_id"
  end

  create_table "reagents", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "unit"
    t.integer "quantity"
    t.string "location"
    t.string "source"
    t.integer "lab_id"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_reagents_on_lab_id"
    t.index ["location_id"], name: "index_reagents_on_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "lab_id"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_users_on_lab_id"
  end

end
