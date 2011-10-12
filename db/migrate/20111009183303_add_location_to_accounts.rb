class AddLocationToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :location, :string
  end

  def self.down
    remove_column :accounts, :location
  end
end
