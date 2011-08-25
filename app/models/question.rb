class Question < ActiveRecord::Base

  belongs_to :exam_type
  has_many :exam_questions
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :answers

end

# == Schema Information
#
# Table name: questions
#
#  id           :integer(4)      not null, primary key
#  owner_id     :integer(4)      not null
#  exam_type_id :integer(4)      not null
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#

