class ExamType < ActiveRecord::Base

  belongs_to :level, :class_name => "ExamLevel", :foreign_key => "exam_level_id"
  belongs_to :category, :class_name => "ExamCategory", :foreign_key => "exam_category_id"
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :exams
  has_many :questions
  has_many :access_levels

end


# == Schema Information
#
# Table name: exam_types
#
#  id               :integer(4)      not null, primary key
#  exam_level_id    :integer(4)      not null
#  exam_category_id :integer(4)      not null
#  owner_id         :integer(4)      not null
#  questions_limit  :integer(4)      default(16), not null
#  time_limit       :integer(4)      default(960), not null
#  created_at       :datetime
#  updated_at       :datetime
#

