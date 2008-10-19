class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.integer :person_id
      t.integer :meeting_id
      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
