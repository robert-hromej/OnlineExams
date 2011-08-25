class Answer < ActiveRecord::Base

  belongs_to :question

end

# == Schema Information
#
# Table name: answers
#
#  id          :integer(4)      not null, primary key
#  question_id :integer(4)      not null
#  is_true     :boolean(1)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

