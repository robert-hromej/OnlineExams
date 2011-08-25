class ExamLevel < ActiveRecord::Base

  has_many :exam_types

end

# == Schema Information
#
# Table name: exam_levels
#
#  id         :integer(4)      not null, primary key
#  level      :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

