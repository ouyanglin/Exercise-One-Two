class AddTwitterIdToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :twitter_id, :integer
  end

  def self.down
    remove_column :tweets, :twitter_id
  end
end
