class AddTwitterUserToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :twitter_user, :string
  end

  def self.down
    remove_column :people, :twitter_user
  end
end