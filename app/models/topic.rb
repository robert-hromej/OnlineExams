class Topic < ActiveRecord::Base

  belongs_to :category
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :exams
  has_many :questions
  has_many :access_levels, :as => "obj"
  has_many :moderator_users, :through => :access_levels, :source => :user

  validates :name, :presence => true,
            :length => {:within => 4..50}

  validates :questions_limit, :numericality => true,
            :inclusion => {:in => 16..120}

  validates :time_limit, :numericality => true,
            :inclusion => {:in => 16..120}

  def access_change?(user)
    owner?(user) || !(moderator_users.where(:id => user.id) + category.moderator_users.where(:id => user.id)).blank?
  end

  def owner?(user)
    owner == user
  end

  def moderators
    moderator_users + topic.moderator_users + topic.category.moderator_users
  end

end

# == Schema Information
#
# Table name: topics
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  category_id     :integer         not null
#  owner_id        :integer         not null
#  questions_limit :integer         default(16), not null
#  time_limit      :integer         default(16), not null
#  created_at      :datetime
#  updated_at      :datetime
#

