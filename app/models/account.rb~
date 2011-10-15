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

require 'net/http'
require 'json/ext'

class Account < ActiveRecord::Base
  attr_accessible :screen_name

  validates :screen_name, :presence => true
  validate :screen_name_exists
  before_save :get_info
  after_save :populate

  has_many :tweets

  USER_URI = "http://api.twitter.com/1/users/show.json?screen_name="
  STATUS = "http://api.twitter.com/1/statuses/user_timeline.json?screen_name="
  COUNT = 200

  private

    def screen_name_exists
      check_url = USER_URI + screen_name
      res = Net::HTTP.get_response(URI.parse(check_url))
      if res.code.to_i != 200
        errors.add(:screen_name, "That Twitter account does not exist")
      end
    end

    def get_info
      uri = USER_URI + screen_name
      res = Net::HTTP.get(URI.parse(uri))
      data = JSON.parse(res)
      self.name = data["name"]
      self.location = data["location"]
      self.description = data["description"]
      self.twitter_id = data["id"]
    end

    def populate
      # grab 200 of the most recent tweets
      uri = STATUS + screen_name + "&count=#{COUNT}"
      res = Net::HTTP.get(URI.parse(uri))
      data = JSON.parse(res)
      # examine each tweet
      data.map do |t|
        # determine if there's a link. If yes, save it down. If no, move on
        if t["text"] =~ /http:\/\//
          params = { :content => t["text"], :time => t["created_at"] }
          self.tweets.create(params)
        end
      end
    end
end
