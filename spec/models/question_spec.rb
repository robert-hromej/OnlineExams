require 'spec_helper'

describe Question do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: questions
#
#  id                 :integer         not null, primary key
#  owner_id           :integer         not null
#  topic_id           :integer         not null
#  body               :text
#  answer_description :text
#  created_at         :datetime
#  updated_at         :datetime
#

