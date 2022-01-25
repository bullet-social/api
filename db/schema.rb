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

ActiveRecord::Schema.define(version: 2022_01_12_181027) do

  create_table "api_keys", force: :cascade do |t|
    t.string "public"
    t.string "secret"
    t.integer "user_id"
    t.boolean "master"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["public"], name: "index_api_keys_on_public"
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "name"
    t.string "bio"
    t.string "password_digest"
    t.string "password_reset_token"
    t.boolean "verified", default: false
    t.integer "subscribers_count", default: 0
    t.integer "subscriptions_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
