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

ActiveRecord::Schema.define(version: 2018_07_24_004021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "addressable_id"
    t.string "addressable_type"
    t.string "city"
    t.datetime "created_at", null: false
    t.string "line1"
    t.string "line2"
    t.string "state"
    t.datetime "updated_at", null: false
    t.string "zip"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.bigint "attachable_id"
    t.string "attachable_type"
    t.text "attachment_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
  end

  create_table "authentication_tokens", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "last_used_at"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_authentication_tokens_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "data_migrations", id: :serial, force: :cascade do |t|
    t.string "version"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "attempts", default: 0, null: false
    t.datetime "created_at"
    t.datetime "failed_at"
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "locked_at"
    t.string "locked_by"
    t.integer "priority", default: 0, null: false
    t.string "queue"
    t.datetime "run_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "attachable_id"
    t.string "attachable_type"
    t.datetime "created_at", null: false
    t.text "image_data"
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_images_on_attachable_type_and_attachable_id"
  end

  create_table "levels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "rpush_apps", force: :cascade do |t|
    t.string "access_token"
    t.datetime "access_token_expiration"
    t.string "apn_key"
    t.string "apn_key_id"
    t.string "auth_key"
    t.string "bundle_id"
    t.text "certificate"
    t.string "client_id"
    t.string "client_secret"
    t.integer "connections", default: 1, null: false
    t.datetime "created_at", null: false
    t.string "environment"
    t.string "name", null: false
    t.string "password"
    t.string "team_id"
    t.string "type", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.integer "app_id"
    t.datetime "created_at", null: false
    t.string "device_token", limit: 64, null: false
    t.datetime "failed_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_token"], name: "index_rpush_feedback_on_device_token"
  end

  create_table "rpush_notifications", force: :cascade do |t|
    t.text "alert"
    t.boolean "alert_is_json", default: false, null: false
    t.integer "app_id", null: false
    t.integer "badge"
    t.string "category"
    t.string "collapse_key"
    t.boolean "content_available", default: false, null: false
    t.datetime "created_at", null: false
    t.text "data"
    t.boolean "delay_while_idle", default: false, null: false
    t.datetime "deliver_after"
    t.boolean "delivered", default: false, null: false
    t.datetime "delivered_at"
    t.string "device_token", limit: 64
    t.integer "error_code"
    t.text "error_description"
    t.integer "expiry", default: 86400
    t.string "external_device_id"
    t.datetime "fail_after"
    t.boolean "failed", default: false, null: false
    t.datetime "failed_at"
    t.boolean "mutable_content", default: false, null: false
    t.text "notification"
    t.integer "priority"
    t.boolean "processing", default: false, null: false
    t.text "registration_ids"
    t.integer "retries", default: 0
    t.string "sound"
    t.string "type", null: false
    t.datetime "updated_at", null: false
    t.string "uri"
    t.text "url_args"
    t.index ["delivered", "failed", "processing", "deliver_after", "created_at"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "day"
    t.text "description"
    t.bigint "level_id"
    t.integer "primary_category_id"
    t.bigint "room_id"
    t.integer "secondary_category_id"
    t.bigint "speaker_id"
    t.string "time"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_sessions_on_level_id"
    t.index ["room_id"], name: "index_sessions_on_room_id"
    t.index ["speaker_id"], name: "index_sessions_on_speaker_id"
  end

  create_table "speakers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.inet "current_sign_in_ip"
    t.datetime "deleted_at"
    t.string "device_token"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.datetime "invitation_accepted_at"
    t.datetime "invitation_created_at"
    t.integer "invitation_limit"
    t.datetime "invitation_sent_at"
    t.string "invitation_token"
    t.integer "invitations_count", default: 0
    t.bigint "invited_by_id"
    t.string "invited_by_type"
    t.string "last_name"
    t.datetime "last_sign_in_at"
    t.inet "last_sign_in_ip"
    t.string "photo_data"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "roles_mask"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authentication_tokens", "users"
  add_foreign_key "sessions", "levels"
  add_foreign_key "sessions", "rooms"
  add_foreign_key "sessions", "speakers"
end
