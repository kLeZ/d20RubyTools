# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more
# migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control
# system.

ActiveRecord::Schema.define(version: 20140523072232) do

	create_table "character_base_infos", force: true do |t|
		t.string   "name",        null: false
		t.integer  "age"
		t.text     "description", null: false
		t.float    "height"
		t.float    "weight"
		t.string   "eyes"
		t.string   "skin"
		t.string   "gender"
		t.string   "hair"
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "feat_templates", force: true do |t|
		t.string   "name",        null: false
		t.text     "description", null: false
		t.string   "formula",     null: false
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "health_points_templates", force: true do |t|
		t.integer  "hp_min_value"
		t.integer  "hp_max_value"
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "level_templates", force: true do |t|
		t.integer  "begin_level",            default: 1, null: false
		t.integer  "end_level",                          null: false
		t.integer  "overpower_level"
		t.integer  "begin_exp",              default: 0, null: false
		t.integer  "end_exp"
		t.integer  "overpower_exp"
		t.string   "levelup_factor_formula",             null: false
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "members", force: true do |t|
		t.integer  "room_id"
		t.integer  "user_id"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.boolean  "is_online",  default: false, null: false
	end

	add_index "members", ["room_id"], name: "index_members_on_room_id", using: :btree
	add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

	create_table "messages", force: true do |t|
		t.string   "body"
		t.integer  "room_id"
		t.integer  "user_id"
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	add_index "messages", ["room_id"], name: "index_messages_on_room_id", using: :btree
	add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

	create_table "rooms", force: true do |t|
		t.string   "name"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.integer  "user_id"
	end

	add_index "rooms", ["name"], name: "index_rooms_on_name", unique: true, using: :btree
	add_index "rooms", ["user_id"], name: "index_rooms_on_user_id", using: :btree

	create_table "rpg_templates", force: true do |t|
		t.string   "name",                      null: false
		t.string   "default_dice",              null: false
		t.boolean  "has_classes",               null: false
		t.boolean  "has_levels",                null: false
		t.boolean  "has_feats",                 null: false
		t.boolean  "has_skills",                null: false
		t.boolean  "has_passive_defense",       null: false
		t.integer  "feat_template_id"
		t.integer  "skill_template_id"
		t.integer  "stat_template_id"
		t.integer  "level_template_id"
		t.integer  "health_points_template_id"
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	add_index "rpg_templates", ["feat_template_id"], name: "index_rpg_templates_on_feat_template_id", using: :btree
	add_index "rpg_templates", ["health_points_template_id"], name: "index_rpg_templates_on_health_points_template_id", using: :btree
	add_index "rpg_templates", ["level_template_id"], name: "index_rpg_templates_on_level_template_id", using: :btree
	add_index "rpg_templates", ["skill_template_id"], name: "index_rpg_templates_on_skill_template_id", using: :btree
	add_index "rpg_templates", ["stat_template_id"], name: "index_rpg_templates_on_stat_template_id", using: :btree

	create_table "skill_templates", force: true do |t|
		t.string   "name",         null: false
		t.integer  "min_value",    null: false
		t.integer  "max_value"
		t.string   "applied_stat"
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "stat_templates", force: true do |t|
		t.string   "name",                         null: false
		t.integer  "min_value",                    null: false
		t.integer  "max_value"
		t.boolean  "has_modifier", default: false, null: false
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "users", force: true do |t|
		t.datetime "created_at"
		t.datetime "updated_at"
		t.string   "email",                  default: "", null: false
		t.string   "encrypted_password",     default: "", null: false
		t.string   "reset_password_token"
		t.datetime "reset_password_sent_at"
		t.datetime "remember_created_at"
		t.integer  "sign_in_count",          default: 0,  null: false
		t.datetime "current_sign_in_at"
		t.datetime "last_sign_in_at"
		t.string   "current_sign_in_ip"
		t.string   "last_sign_in_ip"
		t.string   "username"
		t.integer  "room_id"
	end

	add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
	add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
	add_index "users", ["room_id"], name: "index_users_on_room_id", using: :btree
	add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
