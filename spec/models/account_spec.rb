# == Schema Information
#
# Table name: accounts
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  screen_name :string(255)
#  twitter_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  location    :string(255)
#  description :string(255)
#

require 'spec_helper'

describe Account do

  before(:each) do
    @attr = { :screen_name => "TeamFTF" }
  end

  it "should create a new instance given valid attributes" do
    Account.create!(@attr)
  end

  it "should require a screen name" do
    no_screen_name_account = Account.new(@attr.merge(:screen_name => ""))
    no_screen_name_account.should_not be_valid
  end

  it "should require a valid screen name format" do
    invalid_screen_name = Account.new(@attr.merge(:screen_name => "I$hMon3y"))
    invalid_screen_name.should_not be_valid
  end

  it "should require a screen name that exists" do
    nonexistent_screen_name = Account.new(@attr.merge(:screen_name => "%22m32"))
    nonexistent_screen_name.should_not be_valid
  end

end
