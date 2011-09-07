class Category < ActiveRecord::Base

  has_many :topics
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :access_levels, :as => "obj"
  has_many :moderator_users, :through => :access_levels, :source => :user

  validates :name, :presence => true,
            :uniqueness => {:case_sensitive => false},
            :length => {:within => 1..45}

  def access_change?(user)
    owner?(user) || !self.moderator_users.where(:id => user.id).first.nil?
  end

  def owner?(user)
    owner == user
  end

  def moderators
    moderator_users
  end

end

# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  owner_id   :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

