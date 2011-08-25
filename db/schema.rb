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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110825135039) do

  create_table "access_levels", :force => true do |t|
    t.integer  "user_id",                         :null => false
    t.integer  "exam_category_id", :default => 0, :null => false
    t.integer  "exam_type_id",     :default => 0, :null => false
    t.integer  "role",             :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "access_levels", ["user_id", "exam_type_id", "exam_category_id"], :name => "uniq_indexing", :unique => true

  create_table "answers", :force => true do |t|
    t.integer  "question_id", :null => false
    t.boolean  "is_true",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "exam_categories", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_categories", ["owner_id"], :name => "index_exam_categories_on_owner_id"

  create_table "exam_questions", :force => true do |t|
    t.integer  "exam_id",     :null => false
    t.integer  "question_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_types", :force => true do |t|
    t.string   "name",                              :null => false
    t.integer  "exam_category_id",                  :null => false
    t.integer  "owner_id",                          :null => false
    t.integer  "questions_limit",  :default => 16,  :null => false
    t.integer  "time_limit",       :default => 960, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_types", ["exam_category_id"], :name => "index_exam_types_on_exam_category_id"
  add_index "exam_types", ["owner_id"], :name => "index_exam_types_on_owner_id"

  create_table "exams", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "exam_type_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exams", ["exam_type_id"], :name => "index_exams_on_exam_type_id"
  add_index "exams", ["user_id"], :name => "index_exams_on_user_id"

  create_table "questions", :force => true do |t|
    t.integer  "owner_id",     :null => false
    t.integer  "exam_type_id", :null => false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["exam_type_id"], :name => "index_questions_on_exam_type_id"
  add_index "questions", ["owner_id"], :name => "index_questions_on_owner_id"

  create_table "user", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                                 :default => false
  end

  add_index "user", ["email"], :name => "index_user_on_email", :unique => true
  add_index "user", ["reset_password_token"], :name => "index_user_on_reset_password_token", :unique => true

end
