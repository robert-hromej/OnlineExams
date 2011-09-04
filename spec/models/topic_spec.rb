require 'spec_helper'

describe Topic do
  pending "add some examples to (or delete) #{__FILE__}"
end




# == Schema Information
#
# Table name: topics
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  category_id     :integer         not null
#  owner_id        :integer         not null
#  questions_limit :integer         default(16), not null
#  time_limit      :integer         default(960), not null
#  created_at      :datetime
#  updated_at      :datetime
#

