class AddForeignKey < ActiveRecord::Migration
  def self.up
    add_column :tweets, :account_id, :integer
    remove_column :tweets, :twitter_id
  end

  def self.down
    add_column :tweets, :twitter_id, :integer
    remove_column :tweets, :account_id, :integer
  end
end
