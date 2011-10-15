class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :link_id
      t.string :location
      t.datetime :time
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
