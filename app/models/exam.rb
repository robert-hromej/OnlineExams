class Exam < ActiveRecord::Base

  belongs_to :user
  belongs_to :exam_type
  has_many :exam_questions

end

# == Schema Information
#
# Table name: exams
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)      not null
#  exam_type_id :integer(4)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

