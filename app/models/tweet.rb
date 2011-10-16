# == Schema Information
#
# Table name: tweets
#
#  id         :integer         not null, primary key
#  link_id    :integer
#  time       :datetime
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  account_id :integer
#

class Tweet < ActiveRecord::Base
  attr_accessible :time, :content
  before_save :add_link
  belongs_to :account

  LINK_REG = /(http:\/\/[\w\.\/\?\&\=\+\%]+\b)/i

  private

    def add_link
      LINK_REG.match(self.content)
      link = Link.create(:url => $1)
      self.link_id = link.id
    end
end
