# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171005225912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "archives", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "titlePL"
  end

  create_table "banner_images", force: :cascade do |t|
    t.string   "title"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "image"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "banner_images", ["imageable_type", "imageable_id"], name: "index_banner_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contest_archives", force: :cascade do |t|
    t.string   "title"
    t.string   "titlePL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contest_records", force: :cascade do |t|
    t.string   "title"
    t.string   "titlePL"
    t.text     "body"
    t.text     "bodyPL"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "contest_archive_id"
    t.string   "serial"
    t.integer  "order_position"
  end

  create_table "events", force: :cascade do |t|
    t.text     "timedate"
    t.text     "description"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "timedatePL"
    t.text     "descPL"
  end

  create_table "generals", force: :cascade do |t|
    t.boolean  "registration_conference"
    t.boolean  "registration_contest"
    t.boolean  "voting_contest"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "block_site"
    t.boolean  "program_on"
    t.boolean  "partners_on"
    t.boolean  "archive_on"
    t.boolean  "contest_archive_on"
    t.integer  "contest_archive_id"
    t.boolean  "results_on"
    t.boolean  "voting_on"
    t.integer  "marker_id"
    t.integer  "map_zoom"
    t.integer  "edition_no"
    t.string   "primary_color"
    t.string   "secondary_color"
    t.string   "primary_banner"
    t.string   "secondary_banner"
  end

  create_table "images", force: :cascade do |t|
    t.string   "src"
    t.integer  "registration_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "images", ["registration_id"], name: "index_images_on_registration_id", using: :btree

  create_table "markers", force: :cascade do |t|
    t.float    "lat"
    t.float    "lng"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "color"
  end

  create_table "newsaddresses", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.string   "titlePL"
    t.text     "body"
    t.text     "bodyPL"
  end

  create_table "paragraphs", force: :cascade do |t|
    t.text     "body"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "bodyPL"
  end

  add_index "paragraphs", ["page_id"], name: "index_paragraphs_on_page_id", using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "kind"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "title"
    t.string   "src"
    t.integer  "pictureable_id"
    t.string   "pictureable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "pictures", ["pictureable_type", "pictureable_id"], name: "index_pictures_on_pictureable_type_and_pictureable_id", using: :btree

  create_table "presentation_descs", force: :cascade do |t|
    t.string   "src"
    t.integer  "registration_conference_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "presentation_descs", ["registration_conference_id"], name: "index_presentation_descs_on_registration_conference_id", using: :btree

  create_table "public_images", force: :cascade do |t|
    t.integer  "contest_record_id"
    t.string   "src"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "order_position"
  end

  add_index "public_images", ["contest_record_id"], name: "index_public_images_on_contest_record_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.text     "body"
    t.integer  "archive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "bodyPL"
    t.string   "title"
    t.string   "titlePL"
  end

  add_index "records", ["archive_id"], name: "index_records_on_archive_id", using: :btree

  create_table "registration_conferences", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "street"
    t.string   "city"
    t.string   "zip_code"
    t.string   "country"
    t.string   "university"
    t.string   "email"
    t.boolean  "terms_of_service"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "subject"
    t.string   "attachment"
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "street"
    t.string   "city"
    t.string   "zip_code"
    t.string   "country"
    t.string   "university"
    t.string   "supervising_professor"
    t.string   "email"
    t.boolean  "terms_of_service"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "serial"
    t.string   "group_name"
  end

  create_table "votes", force: :cascade do |t|
    t.string   "ip_address"
    t.integer  "contest_record_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "votes", ["contest_record_id"], name: "index_votes_on_contest_record_id", using: :btree

  add_foreign_key "images", "registrations"
  add_foreign_key "paragraphs", "pages"
  add_foreign_key "presentation_descs", "registration_conferences"
  add_foreign_key "public_images", "contest_records"
  add_foreign_key "records", "archives"
  add_foreign_key "votes", "contest_records"
end
