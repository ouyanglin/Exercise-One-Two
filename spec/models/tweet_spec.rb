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

require 'spec_helper'

describe Tweet do
  pending "add some examples to (or delete) #{__FILE__}"
end
