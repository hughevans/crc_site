class AddOpenId < ActiveRecord::Migration
  # from the OpenID-RailsKit

  def self.up

    create_table "open_id_authentication_associations", :force => true do |t|
      t.integer "issued"
      t.integer "lifetime"
      t.string  "handle"
      t.string  "assoc_type"
      t.binary  "server_url"
      t.binary  "secret"
    end

    create_table "open_id_authentication_nonces", :force => true do |t|
      t.integer "timestamp",  :null => false
      t.string  "server_url"
      t.string  "salt",       :null => false
    end

    create_table "users", :force => true do |t|
      t.string   "login",                     :limit => 40
      t.string   "name",                      :limit => 100, :default => ""
      t.string   "email",                     :limit => 100
      t.string   "crypted_password",          :limit => 40
      t.string   "salt",                      :limit => 40
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "remember_token",            :limit => 40
      t.datetime "remember_token_expires_at"
      t.string   "identity_url"
    end

    add_index "users", ["login"], :name => "index_users_on_login"

  end

  def self.down
    drop_table "open_id_authentication_association"
    drop_table "open_id_authentication_nonces"
    drop_table "users"
  end
end
