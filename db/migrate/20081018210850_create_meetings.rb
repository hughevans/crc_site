class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.datetime :date
      t.string :venue

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
