class ExamQuestion < ActiveRecord::Base

  belongs_to :exam
  belongs_to :question

end

# == Schema Information
#
# Table name: exam_questions
#
#  id          :integer(4)      not null, primary key
#  exam_id     :integer(4)      not null
#  question_id :integer(4)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

