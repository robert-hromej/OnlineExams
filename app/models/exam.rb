class Exam < ActiveRecord::Base

  belongs_to :user
  belongs_to :topic
  has_many :exam_questions

end


# == Schema Information
#
# Table name: exams
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  topic_id   :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

