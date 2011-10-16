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

  private

    def pull_info
      # check if URL is the final URL (i.e, follow all the redirects)
      fetch (URI.parse(self.url))
      # pull out meta info from the site to form site description
      # pull out meta info from the site to form keywords
    end

    def fetch (uri, limit = 10)
      res = Net::HTTP.get_response(uri)
      if res.code == 301
        redirect = URI.parse(res['location'])
        fetch (redirect, limit-1)
      end
      self.url = uri.to_s
    end
end
