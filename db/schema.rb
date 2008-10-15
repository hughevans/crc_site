# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081015120059) do

  create_table "attendance", :id => false, :force => true do |t|
    t.integer "meeting_id", :limit => 11
    t.integer "person_id",  :limit => 11
  end

  create_table "bj_config", :primary_key => "bj_config_id", :force => true do |t|
    t.text "hostname"
    t.text "key"
    t.text "value"
    t.text "cast"
  end

  create_table "bj_job", :primary_key => "bj_job_id", :force => true do |t|
    t.text     "command"
    t.text     "state"
    t.integer  "priority",       :limit => 11
    t.text     "tag"
    t.integer  "is_restartable", :limit => 11
    t.text     "submitter"
    t.text     "runner"
    t.integer  "pid",            :limit => 11
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.text     "env"
    t.text     "stdin"
    t.text     "stdout"
    t.text     "stderr"
    t.integer  "exit_status",    :limit => 11
  end

  create_table "bj_job_archive", :primary_key => "bj_job_archive_id", :force => true do |t|
    t.text     "command"
    t.text     "state"
    t.integer  "priority",       :limit => 11
    t.text     "tag"
    t.integer  "is_restartable", :limit => 11
    t.text     "submitter"
    t.text     "runner"
    t.integer  "pid",            :limit => 11
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.text     "env"
    t.text     "stdin"
    t.text     "stdout"
    t.text     "stderr"
    t.integer  "exit_status",    :limit => 11
  end

  create_table "comments", :force => true do |t|
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id",  :limit => 11
    t.integer  "topic_id",   :limit => 11
  end

  create_table "meetings", :force => true do |t|
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "venue"
  end

  create_table "people", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "github_user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_user"
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meeting_id",  :limit => 11
  end

end
