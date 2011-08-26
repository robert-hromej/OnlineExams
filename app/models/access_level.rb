class AccessLevel < ActiveRecord::Base

  GHOST = 1
  MODERATOR = 2
  ADMIN = 4

  belongs_to :user
  belongs_to :exam_type
  belongs_to :category

end


# == Schema Information
#
# Table name: access_levels
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)      not null
#  category_id  :integer(4)      default(0), not null
#  exam_type_id :integer(4)      default(0), not null
#  role         :integer(4)      default(1), not null
#  created_at   :datetime
#  updated_at   :datetime
#

