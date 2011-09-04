class Answer < ActiveRecord::Base

  belongs_to :question

end

# == Schema Information
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  question_id :integer         not null
#  is_true     :boolean         not null
#  created_at  :datetime
#  updated_at  :datetime
#

# == Schema Information
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  question_id :integer         not null
#  is_true     :boolean         not null
#  created_at  :datetime
#  updated_at  :datetime
#

