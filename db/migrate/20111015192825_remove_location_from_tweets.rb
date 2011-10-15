class RemoveLocationFromTweets < ActiveRecord::Migration
  def self.up
    remove_column :tweets, :location
  end

  def self.down
    add_column :tweets, :location, :string
  end
end
