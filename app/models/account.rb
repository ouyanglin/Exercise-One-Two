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
#

class Account < ActiveRecord::Base
  attr_accessible :screen_name

  validates :name, :presence => true
end