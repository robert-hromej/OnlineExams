class ExamQuestion < ActiveRecord::Base

  belongs_to :exam
  belongs_to :question
  has_many :question_answers
  has_many :answers, :through => :question_answers

  def answering(answer_ids)
    case
      when answer_ids.blank? then
        nil
      when answer_ids.is_a?(Array) || answer_ids.is_a?(String) then
        Answer.where(:id => answer_ids, :question_id => self.question_id)
      else
        nil
    end
  end

end

# == Schema Information
#
# Table name: exam_questions
#
#  id          :integer         not null, primary key
#  exam_id     :integer         not null
#  question_id :integer         not null
#  answered    :boolean         default(FALSE), not null
#  created_at  :datetime
#  updated_at  :datetime
#

