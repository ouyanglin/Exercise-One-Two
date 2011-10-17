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
  belongs_to :link

  LINK_REG = /(http:\/\/[\w\.\/\?\&\=\+\%]+\b)/i

  private

    def add_link
      LINK_REG.match(self.content)
      uri_str = fetch($1)
      link = nil
      if Link.find_by_url(uri_str)
        link = Link.find_by_url(uri_str)
      else
        link = Link.create!(:url => uri_str)
      end
      self.link_id = link.id
    end
    
    # This code is taken from ruby-doc.org/stdlib-1.9.2/libdoc/net/http/rdoc/
    # Net/HTTP.html
    def fetch(uri_str, limit = 10)
      raise ArgumentError, 'HTTP redirect too deep' if limit == 0

      uri = URI.parse(URI.encode(uri_str))
      http_session = Net::HTTP.new(uri.host, uri.port)
      http_session.use_ssl = true if uri.port == 443
      res = nil
      http_session.start { |http|
        res = http.request_get(uri.request_uri)
      }

      case res
      when Net::HTTPSuccess     then uri_str
      when Net::HTTPRedirection 
        if res.code.to_i != 302
          fetch(res['location'], limit - 1)
        else
          uri_str
        end
      else
        res.error!
      end
    end
end
