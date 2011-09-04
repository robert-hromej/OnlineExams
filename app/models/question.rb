class Question < ActiveRecord::Base

  belongs_to :topic
  has_many :exam_questions
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :answers

end

# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  owner_id   :integer         not null
#  topic_id   :integer         not null
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  owner_id   :integer         not null
#  topic_id   :integer         not null
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

