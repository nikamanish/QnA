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

ActiveRecord::Schema.define(version: 20170202130606) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "post_id"
    t.text     "content",    limit: 65535
    t.integer  "likes",                    default: 0
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["post_id"], name: "fk_rails_2fd19c0db7", using: :btree
    t.index ["user_id"], name: "fk_rails_03de2dc08c", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sender_id"
    t.integer  "group_id"
    t.integer  "receiver_id"
    t.boolean  "read",        default: false
    t.boolean  "accepted",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["group_id"], name: "fk_rails_fe69389933", using: :btree
    t.index ["receiver_id"], name: "fk_rails_1ac0cd1f08", using: :btree
    t.index ["sender_id"], name: "fk_rails_892c9262cb", using: :btree
  end

  create_table "memberships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "admin",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["group_id"], name: "fk_rails_aaf389f138", using: :btree
    t.index ["user_id"], name: "fk_rails_99326fb65d", using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",       limit: 65535
    t.integer  "membership_id"
    t.integer  "upvotes",                     default: 0
    t.integer  "downvote",                    default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.text     "subject",       limit: 65535
    t.index ["membership_id"], name: "fk_rails_56160f5775", using: :btree
  end

  create_table "requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sender_id"
    t.integer  "group_id"
    t.boolean  "granted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "fk_rails_16b605658f", using: :btree
    t.index ["sender_id"], name: "fk_rails_dafc123fb2", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "invitations", "groups"
  add_foreign_key "invitations", "users", column: "receiver_id"
  add_foreign_key "invitations", "users", column: "sender_id"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
  add_foreign_key "posts", "memberships"
  add_foreign_key "requests", "groups"
  add_foreign_key "requests", "users", column: "sender_id"
end
