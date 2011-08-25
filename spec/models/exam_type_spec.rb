require 'spec_helper'

describe ExamType do
  pending "add some examples to (or delete) #{__FILE__}"
end



# == Schema Information
#
# Table name: exam_types
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)     not null
#  exam_category_id :integer(4)      not null
#  owner_id         :integer(4)      not null
#  questions_limit  :integer(4)      default(16), not null
#  time_limit       :integer(4)      default(960), not null
#  created_at       :datetime
#  updated_at       :datetime
#

