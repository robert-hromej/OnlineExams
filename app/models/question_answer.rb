class QuestionAnswer < ActiveRecord::Base

  belongs_to :answer
  belongs_to :exam_question

end

# == Schema Information
#
# Table name: question_answers
#
#  id               :integer         not null, primary key
#  answer_id        :integer         not null
#  exam_question_id :integer         not null
#  created_at       :datetime
#  updated_at       :datetime
#

