require 'spec_helper'

describe AccessLevel do
  pending "add some examples to (or delete) #{__FILE__}"
end



# == Schema Information
#
# Table name: access_levels
#
#  id          :integer         not null, primary key
#  user_id     :integer         not null
#  category_id :integer         default(0), not null
#  topic_id    :integer         default(0), not null
#  role        :integer         default(1), not null
#  created_at  :datetime
#  updated_at  :datetime
#

