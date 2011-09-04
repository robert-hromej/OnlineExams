class AccessLevel < ActiveRecord::Base

  GHOST = 1
  MODERATOR = 2
  ADMIN = 4

  belongs_to :user
  belongs_to :topic
  belongs_to :category

end

# == Schema Information
#
# Table name: access_levels
#
#  id          :integer         not null, primary key
#  user_id     :integer         not null
#  category_id :integer         default(0), not null
#  topic_id    :integer         default(0), not null
#  role        :integer         default(1), not null
#  created_at  :datetime
#  updated_at  :datetime
#

# == Schema Information
#
# Table name: access_levels
#
#  id          :integer         not null, primary key
#  user_id     :integer         not null
#  category_id :integer         default(0), not null
#  topic_id    :integer         default(0), not null
#  role        :integer         default(1), not null
#  created_at  :datetime
#  updated_at  :datetime
#

