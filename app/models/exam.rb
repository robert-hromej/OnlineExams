class Exam < ActiveRecord::Base

  belongs_to :user
  belongs_to :topic
  has_many :exam_questions

  def generate_questions
    self.topic.questions.order("RANDOM()").limit(self.topic.questions_limit).each do |question|
      self.exam_questions.create(:question => question)
    end
  end

  def active?
    if self.finished_at.nil?
      if (self.created_at + self.topic.time_limit.minute) < Time.now || self.exam_questions.where(:answered => true).size == self.exam_questions.size
        self.finished_at = Time.now
        self.save
      end
    end
    self.finished_at.nil?
  end


end

# == Schema Information
#
# Table name: exams
#
#  id          :integer         not null, primary key
#  user_id     :integer         not null
#  topic_id    :integer         not null
#  finished_at :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

