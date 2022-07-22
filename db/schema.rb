ActiveRecord::Schema.define(version: 2022_07_21_222313) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "charge"
    t.integer "gym_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_memberships_on_client_id"
    t.index ["gym_id"], name: "index_memberships_on_gym_id"
  end

  add_foreign_key "memberships", "clients"
  add_foreign_key "memberships", "gyms"
end
