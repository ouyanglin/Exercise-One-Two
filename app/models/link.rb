# == Schema Information
#
# Table name: links
#
#  id               :integer         not null, primary key
#  url              :string(255)
#  site_description :string(255)
#  created_at       :datetime
#  updated_at       :datetime

require 'net/http'

class Link < ActiveRecord::Base
  attr_accessible :url
  before_save :pull_info
  has_many :tweets

  private

    def pull_info
      # pull out meta info from the site to form site description
      # pull out meta info from the site to form keywords
    end
end
