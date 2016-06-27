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

ActiveRecord::Schema.define(version: 20160609171922) do

  create_table "Destination", primary_key: "destination_id", force: :cascade do |t|
    t.integer "country_id",    limit: 4,   default: 0
    t.string  "name",          limit: 255, default: ""
    t.integer "destinationId", limit: 4,                null: false
  end

  add_index "destination", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "accommodation_category", primary_key: "accommodation_category_id", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
  end

  add_index "accommodation_category", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "accommodation_category_ass", primary_key: "accommodation_category_ass_id", force: :cascade do |t|
    t.integer "accommodation_id",          limit: 4, default: 0, null: false
    t.integer "accommodation_category_id", limit: 4, default: 0, null: false
  end

  create_table "accommodation_location_ass", primary_key: "accommodation_location_ass_id", force: :cascade do |t|
    t.integer  "accommodation_id", limit: 4, default: 0, null: false
    t.integer  "location_id",      limit: 4, default: 0, null: false
    t.datetime "time_created",                           null: false
    t.datetime "time_modified",                          null: false
  end

  create_table "accommodation_price_range", primary_key: "price_range_id", force: :cascade do |t|
    t.string "price_range", limit: 25, default: "", null: false
  end

  create_table "accommodations", primary_key: "accommodation_id", force: :cascade do |t|
    t.integer  "destination_id",            limit: 4,     default: 0,     null: false
    t.integer  "accommodation_category_id", limit: 4,     default: 0
    t.string   "name",                      limit: 255,   default: "",    null: false
    t.integer  "price",                     limit: 4
    t.string   "telephone",                 limit: 255
    t.string   "fax",                       limit: 255
    t.string   "address",                   limit: 255
    t.string   "email",                     limit: 255
    t.string   "web_address",               limit: 255
    t.string   "details",                   limit: 255
    t.text     "description",               limit: 65535
    t.integer  "has_beach",                 limit: 1
    t.integer  "has_casino",                limit: 1
    t.integer  "is_all_inclusive",          limit: 1
    t.integer  "is_family_friendly",        limit: 1
    t.boolean  "show_email"
    t.boolean  "show_web_address"
    t.boolean  "show_listings"
    t.integer  "qualification_level",       limit: 1
    t.datetime "created_at"
    t.datetime "modified_at"
    t.integer  "customer_id",               limit: 4
    t.integer  "num_photos",                limit: 4,     default: 0
    t.boolean  "has_internet",                            default: false
    t.boolean  "is_near_golf_course",                     default: false
    t.boolean  "has_logo",                                default: false
    t.string   "admin_contact",             limit: 255
    t.string   "admin_email",               limit: 255
    t.string   "admin_phone",               limit: 255
    t.string   "hotel_url",                 limit: 255
    t.string   "affiliate_url",             limit: 255
    t.integer  "country_id",                limit: 4
  end

  add_index "accommodations", ["country_id"], name: "index_accommodations_on_country_id", using: :btree

  create_table "activity", primary_key: "activity_id", force: :cascade do |t|
    t.integer  "location_id",          limit: 4,     default: 0,     null: false
    t.integer  "activity_category_id", limit: 4,     default: 0,     null: false
    t.string   "name",                 limit: 255,   default: "",    null: false
    t.integer  "price",                limit: 4
    t.string   "telephone",            limit: 255
    t.string   "fax",                  limit: 255
    t.string   "address",              limit: 255
    t.string   "email",                limit: 255
    t.string   "web_address",          limit: 255
    t.string   "details",              limit: 255
    t.text     "description",          limit: 65535
    t.boolean  "show_email"
    t.boolean  "show_web_address"
    t.boolean  "show_listings"
    t.integer  "qualification_level",  limit: 1
    t.datetime "time_created"
    t.datetime "time_modified",                                      null: false
    t.integer  "customer_id",          limit: 4
    t.integer  "num_photos",           limit: 4,     default: 0
    t.boolean  "has_logo",                           default: false
  end

  create_table "activity_category", primary_key: "activity_category_id", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
  end

  add_index "activity_category", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "activity_category_ass", primary_key: "activity_category_ass_id", force: :cascade do |t|
    t.integer "activity_id",          limit: 4, default: 0, null: false
    t.integer "activity_category_id", limit: 4, default: 0, null: false
  end

  create_table "activity_location_ass", primary_key: "activity_location_id", force: :cascade do |t|
    t.integer  "activity_id",   limit: 4, default: 0, null: false
    t.integer  "location_id",   limit: 4, default: 0, null: false
    t.datetime "time_created",                        null: false
    t.datetime "time_modified",                       null: false
  end

  create_table "bus_listing_category_ass", primary_key: "bus_listing_category_ass_id", force: :cascade do |t|
    t.integer "business_listing_id",          limit: 4, default: 0, null: false
    t.integer "business_listing_category_id", limit: 4, default: 0, null: false
  end

  create_table "business_listing", primary_key: "business_listing_id", force: :cascade do |t|
    t.integer  "destination_id",      limit: 4,     default: 0,  null: false
    t.string   "name",                limit: 255,   default: "", null: false
    t.string   "telephone",           limit: 255
    t.string   "fax",                 limit: 255
    t.string   "address",             limit: 255
    t.string   "email",               limit: 255
    t.string   "web_address",         limit: 255
    t.string   "details",             limit: 255
    t.text     "description",         limit: 65535
    t.boolean  "show_email"
    t.boolean  "show_web_address"
    t.boolean  "show_listings"
    t.datetime "time_created"
    t.datetime "time_modified",                                  null: false
    t.integer  "customer_id",         limit: 4
    t.integer  "qualification_level", limit: 1
    t.string   "po_box",              limit: 10
    t.string   "city",                limit: 32
    t.string   "state",               limit: 32
    t.integer  "country_id",          limit: 4
    t.string   "zip",                 limit: 20
    t.string   "phone_2",             limit: 24
    t.string   "island",              limit: 32
    t.string   "tag",                 limit: 5
    t.boolean  "featured"
    t.boolean  "homepage_featured"
    t.string   "admin_contact",       limit: 255
    t.string   "admin_email",         limit: 255
    t.string   "admin_phone",         limit: 255
    t.integer  "old_links_id",        limit: 4
    t.string   "country",             limit: 255
    t.string   "toll_free",           limit: 255
  end

  create_table "business_listing_category", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
  end

  add_index "business_listing_category", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "business_listing_category_ass", force: :cascade do |t|
    t.integer "business_listing_id",          limit: 4, default: 0, null: false
    t.integer "business_listing_category_id", limit: 4, default: 0, null: false
  end

  create_table "calendar_event", primary_key: "calendar_event_id", force: :cascade do |t|
    t.integer "destination_id", limit: 4,  default: 0, null: false
    t.integer "year",           limit: 4
    t.integer "month",          limit: 4
    t.string  "start_day",      limit: 11
    t.string  "end_day",        limit: 11
    t.integer "content_id",     limit: 4
  end

  create_table "contact", primary_key: "contact_id", force: :cascade do |t|
    t.string   "contact_name",              limit: 255, default: "", null: false
    t.string   "contact_email",             limit: 255, default: "", null: false
    t.string   "telephone_day_time",        limit: 20
    t.string   "telephone_evening",         limit: 20
    t.integer  "persons_in_party_adults",   limit: 1
    t.integer  "persons_in_party_children", limit: 1
    t.integer  "persons_in_party_infants",  limit: 1
    t.date     "arrival_date"
    t.integer  "number_of_nights",          limit: 1
    t.string   "comments",                  limit: 255
    t.string   "domain_from",               limit: 50
    t.string   "destination",               limit: 50
    t.string   "category",                  limit: 50
    t.string   "client_name",               limit: 50
    t.string   "client_email",              limit: 255
    t.datetime "time_created",                                       null: false
    t.datetime "time_modified",                                      null: false
    t.integer  "qualification_level",       limit: 1
  end

  create_table "content", primary_key: "content_id", force: :cascade do |t|
    t.string "name",    limit: 255,      default: "", null: false
    t.text   "content", limit: 16777215
  end

  create_table "contest", id: false, force: :cascade do |t|
    t.string "title",                        limit: 100,      default: ""
    t.string "first_name",                   limit: 100,      default: ""
    t.string "last_name",                    limit: 100,      default: ""
    t.string "street",                       limit: 100,      default: ""
    t.string "city",                         limit: 100
    t.string "state",                        limit: 100,      default: ""
    t.string "country",                      limit: 100,      default: ""
    t.string "zip",                          limit: 100,      default: ""
    t.string "email",                        limit: 100,      default: ""
    t.string "sex",                          limit: 100
    t.string "age",                          limit: 100
    t.string "income",                       limit: 100,      default: ""
    t.string "education",                    limit: 100,      default: ""
    t.string "marital_status",               limit: 100,      default: ""
    t.string "children",                     limit: 100,      default: ""
    t.string "weeks_of_vacation",            limit: 100,      default: ""
    t.string "destinations_visited",         limit: 100,      default: ""
    t.string "days_spent",                   limit: 100,      default: ""
    t.string "purpose_of_visit",             limit: 100,      default: ""
    t.string "previous_visits",              limit: 100,      default: ""
    t.string "return",                       limit: 100,      default: ""
    t.string "arrival_method",               limit: 100,      default: ""
    t.string "timeshare",                    limit: 100,      default: ""
    t.string "vehicle_rented",               limit: 100,      default: ""
    t.string "consider_other_destinations",  limit: 100,      default: ""
    t.string "other_destination_considered", limit: 100,      default: ""
    t.string "reason_for_bahamas",           limit: 100,      default: ""
    t.string "decision_influenced_by",       limit: 100,      default: ""
    t.string "visited_other_caribbean",      limit: 100,      default: ""
    t.string "which_caribbean",              limit: 100,      default: ""
    t.string "compared_to_bahamas",          limit: 100,      default: ""
    t.string "reference_sources",            limit: 100,      default: ""
    t.text   "bahamas_pubs_nassau",          limit: 16777215
    t.text   "bahamas_pubs_freeport",        limit: 16777215
    t.text   "helpful_pubs_nassau",          limit: 16777215
    t.text   "helpful_pubs_freeport",        limit: 16777215
    t.string "pubs_you_liked",               limit: 100,      default: ""
    t.string "info_was_used_for",            limit: 100,      default: ""
    t.string "info_satisfying",              limit: 100,      default: ""
    t.text   "suggestions",                  limit: 16777215
    t.string "were_pubs_taken_home",         limit: 100,      default: ""
    t.string "name_of_pubs_taken",           limit: 100,      default: ""
    t.string "like_to_have_before_leaving",  limit: 100,      default: ""
    t.string "pay_to_have_before_leaving",   limit: 100,      default: ""
    t.string "which_would_you_pay_for",      limit: 100,      default: ""
    t.string "time_stamp",                   limit: 100,      default: "0000-00-00"
    t.string "source",                       limit: 100,      default: ""
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "country", primary_key: "country_id", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
  end

  add_index "country", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "customer", primary_key: "customer_id", force: :cascade do |t|
    t.string   "full_name",           limit: 255, default: "", null: false
    t.string   "company_name",        limit: 255, default: "", null: false
    t.string   "mailing_address_1",   limit: 50
    t.string   "mailing_address_2",   limit: 50
    t.string   "po_box",              limit: 50
    t.string   "city_town",           limit: 50
    t.string   "state_province",      limit: 50
    t.string   "zip_postal_cd",       limit: 30
    t.string   "country",             limit: 100
    t.string   "phone_work",          limit: 20,  default: "", null: false
    t.string   "phone_cell",          limit: 20
    t.string   "fax",                 limit: 20
    t.string   "email",               limit: 255
    t.string   "comments",            limit: 255
    t.datetime "time_created",                                 null: false
    t.datetime "time_modified",                                null: false
    t.integer  "qualification_level", limit: 1
  end

  create_table "faq", force: :cascade do |t|
    t.integer "destination_id", limit: 4,        default: 0, null: false
    t.text    "content",        limit: 16777215
  end

  create_table "feature", primary_key: "feature_id", force: :cascade do |t|
    t.integer  "destination_id", limit: 4,        default: 0,  null: false
    t.integer  "image_id",       limit: 4
    t.integer  "content_id",     limit: 4
    t.integer  "page_id",        limit: 4
    t.integer  "section",        limit: 4
    t.string   "heading",        limit: 255,      default: "", null: false
    t.string   "big_title",      limit: 255
    t.string   "small_title",    limit: 255
    t.string   "introduction",   limit: 255
    t.text     "content",        limit: 16777215
    t.text     "image_url",      limit: 65535
    t.datetime "time_created"
    t.datetime "time_modified",                                null: false
  end

  create_table "general_info", force: :cascade do |t|
    t.integer "destination_id", limit: 4,        default: 0, null: false
    t.text    "content",        limit: 16777215
  end

  create_table "handbook_listing", primary_key: "business_listing_id", force: :cascade do |t|
    t.string   "listing_type",        limit: 255,   default: "business", null: false
    t.integer  "location_id",         limit: 4,     default: 0,          null: false
    t.string   "name",                limit: 255,   default: "",         null: false
    t.string   "telephone",           limit: 255
    t.string   "fax",                 limit: 255
    t.string   "address",             limit: 255
    t.string   "email",               limit: 255
    t.string   "web_address",         limit: 255
    t.string   "details",             limit: 255
    t.text     "description",         limit: 65535
    t.boolean  "show_email"
    t.boolean  "show_web_address"
    t.boolean  "show_listings"
    t.datetime "time_created"
    t.datetime "time_modified",                                          null: false
    t.integer  "customer_id",         limit: 4
    t.integer  "qualification_level", limit: 1
    t.integer  "category_id1",        limit: 4
    t.integer  "category_id2",        limit: 4
    t.integer  "category_id3",        limit: 4
    t.integer  "category_id4",        limit: 4
    t.integer  "category_id5",        limit: 4
  end

  add_index "handbook_listing", ["business_listing_id"], name: "listing", unique: true, using: :btree
  add_index "handbook_listing", ["location_id"], name: "location_id", using: :btree

  create_table "handbook_listing_category", primary_key: "business_listing_category_id", force: :cascade do |t|
    t.string "business_listing_type", limit: 255, default: ""
    t.string "name",                  limit: 255, default: ""
    t.text   "see_also",              limit: 255
  end

  add_index "handbook_listing_category", ["business_listing_category_id"], name: "UC_cat_id", unique: true, using: :btree
  add_index "handbook_listing_category", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "handbook_listing_category_ass", primary_key: "bus_listing_category_ass_id", force: :cascade do |t|
    t.integer "business_listing_id",          limit: 4, default: 0, null: false
    t.integer "business_listing_category_id", limit: 4, default: 0, null: false
  end

  add_index "handbook_listing_category_ass", ["business_listing_category_id"], name: "business_listing_category_id", using: :btree
  add_index "handbook_listing_category_ass", ["business_listing_id"], name: "business_listing_id", using: :btree

  create_table "hotels", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "image", primary_key: "image_id", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
    t.string "url",  limit: 255
  end

  create_table "link", primary_key: "link_id", force: :cascade do |t|
    t.integer "page_id",  limit: 4,   default: 0,  null: false
    t.string  "name",     limit: 255, default: "", null: false
    t.string  "url",      limit: 255
    t.string  "location", limit: 255
  end

  create_table "location", primary_key: "location_id", force: :cascade do |t|
    t.integer "destination_id", limit: 4,   default: 0,  null: false
    t.string  "name",           limit: 255, default: "", null: false
  end

  add_index "location", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "overview", primary_key: "overview_id", force: :cascade do |t|
    t.integer "destination_id", limit: 4,   default: 0,  null: false
    t.string  "type",           limit: 255, default: "", null: false
    t.integer "image_id",       limit: 4
    t.integer "content_id",     limit: 4
    t.string  "title",          limit: 255
    t.string  "heading",        limit: 255
  end

  create_table "page", primary_key: "page_id", force: :cascade do |t|
    t.integer "destination_id", limit: 4,   default: 0,  null: false
    t.string  "name",           limit: 255, default: "", null: false
  end

  create_table "price_range", primary_key: "price_range_id", force: :cascade do |t|
    t.string "price_range", limit: 25, default: "", null: false
  end

  create_table "restaurant", primary_key: "restaurant_id", force: :cascade do |t|
    t.integer  "location_id",            limit: 4,     default: 0,     null: false
    t.integer  "restaurant_category_id", limit: 4,     default: 0,     null: false
    t.string   "name",                   limit: 255,   default: "",    null: false
    t.integer  "price",                  limit: 4
    t.string   "telephone",              limit: 255
    t.string   "fax",                    limit: 255
    t.string   "address",                limit: 255
    t.string   "email",                  limit: 255
    t.string   "web_address",            limit: 255
    t.string   "details",                limit: 255
    t.text     "description",            limit: 65535
    t.integer  "has_happyhour",          limit: 1
    t.integer  "is_formal",              limit: 1
    t.integer  "has_livemusic",          limit: 1
    t.integer  "make_reservation",       limit: 1
    t.boolean  "show_email"
    t.boolean  "show_web_address"
    t.boolean  "show_listings"
    t.integer  "qualification_level",    limit: 1
    t.datetime "time_created"
    t.datetime "time_modified",                                        null: false
    t.integer  "customer_id",            limit: 4
    t.integer  "num_photos",             limit: 4,     default: 0
    t.boolean  "has_logo",                             default: false
  end

  create_table "restaurant_category", primary_key: "restaurant_category_id", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
  end

  add_index "restaurant_category", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "restaurant_category_ass", primary_key: "restaurant_category_ass_id", force: :cascade do |t|
    t.integer "restaurant_id",          limit: 4, default: 0, null: false
    t.integer "restaurant_category_id", limit: 4, default: 0, null: false
  end

  create_table "restaurant_location_ass", primary_key: "restaurant_location_ass_id", force: :cascade do |t|
    t.integer  "restaurant_id", limit: 4, default: 0, null: false
    t.integer  "location_id",   limit: 4, default: 0, null: false
    t.datetime "time_created",                        null: false
    t.datetime "time_modified",                       null: false
  end

  create_table "restaurant_price_range", primary_key: "price_range_id", force: :cascade do |t|
    t.string "price_range", limit: 25, default: "", null: false
  end

  create_table "shopping", primary_key: "shopping_id", force: :cascade do |t|
    t.integer  "location_id",          limit: 4,     default: 0,     null: false
    t.integer  "shopping_category_id", limit: 4,     default: 0,     null: false
    t.string   "name",                 limit: 255,   default: "",    null: false
    t.string   "telephone",            limit: 255
    t.string   "fax",                  limit: 255
    t.string   "address",              limit: 255
    t.string   "email",                limit: 255
    t.string   "web_address",          limit: 255
    t.string   "details",              limit: 255
    t.text     "description",          limit: 65535
    t.integer  "price",                limit: 4,     default: 0
    t.boolean  "show_email"
    t.boolean  "show_web_address"
    t.boolean  "show_listings"
    t.integer  "qualification_level",  limit: 1
    t.datetime "time_created"
    t.datetime "time_modified",                                      null: false
    t.integer  "customer_id",          limit: 4
    t.integer  "num_photos",           limit: 4,     default: 0
    t.boolean  "has_logo",                           default: false
  end

  create_table "shopping_category", primary_key: "shopping_category_id", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
  end

  add_index "shopping_category", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "shopping_category_ass", primary_key: "shopping_category_ass_id", force: :cascade do |t|
    t.integer "shopping_id",          limit: 4, default: 0, null: false
    t.integer "shopping_category_id", limit: 4, default: 0, null: false
  end

  create_table "shopping_location_ass", primary_key: "shopping_location_ass_id", force: :cascade do |t|
    t.integer  "shopping_id",   limit: 4, default: 0, null: false
    t.integer  "location_id",   limit: 4, default: 0, null: false
    t.datetime "time_created",                        null: false
    t.datetime "time_modified",                       null: false
  end

  create_table "transport", primary_key: "transport_id", force: :cascade do |t|
    t.integer  "location_id",           limit: 4,     default: 0,     null: false
    t.integer  "transport_category_id", limit: 4,     default: 0,     null: false
    t.string   "name",                  limit: 255,   default: "",    null: false
    t.integer  "price",                 limit: 4
    t.string   "telephone",             limit: 255
    t.string   "fax",                   limit: 255
    t.string   "address",               limit: 255
    t.string   "email",                 limit: 255
    t.string   "web_address",           limit: 255
    t.string   "details",               limit: 255
    t.text     "description",           limit: 65535
    t.boolean  "show_email"
    t.boolean  "show_web_address"
    t.boolean  "show_listings"
    t.integer  "qualification_level",   limit: 1
    t.datetime "time_created"
    t.datetime "time_modified",                                       null: false
    t.integer  "customer_id",           limit: 4
    t.integer  "num_photos",            limit: 4,     default: 0
    t.boolean  "has_logo",                            default: false
  end

  create_table "transport_category", primary_key: "transport_category_id", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
  end

  add_index "transport_category", ["name"], name: "UC_name", unique: true, using: :btree

  create_table "transport_category_ass", primary_key: "transport_category_ass_id", force: :cascade do |t|
    t.integer "transport_id",          limit: 4, default: 0, null: false
    t.integer "transport_category_id", limit: 4, default: 0, null: false
  end

  create_table "travel_info", force: :cascade do |t|
    t.integer "destination_id", limit: 4,        default: 0, null: false
    t.text    "content",        limit: 16777215
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
  end

  add_foreign_key "accommodations", "countries"
end
