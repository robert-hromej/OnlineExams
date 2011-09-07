class AccessLevel < ActiveRecord::Base

  GHOST = 1
  MODERATOR = 2
  ADMIN = 4

  belongs_to :user
  belongs_to :obj, :polymorphic => :true

end

# == Schema Information
#
# Table name: access_levels
#
#  id         :integer         not null, primary key
#  obj_id     :integer         not null
#  obj_type   :string(255)     not null
#  user_id    :integer         not null
#  role       :integer         default(1), not null
#  created_at :datetime
#  updated_at :datetime
#

