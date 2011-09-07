class Question < ActiveRecord::Base

  belongs_to :topic
  has_many :exam_questions
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :answers
  has_many :access_levels, :as => "obj"
  has_many :moderator_users, :through => :access_levels, :source => :user


  def access_change?(user)
    owner?(user) || !(moderator_users.where(:id => user.id) +
        topic.moderator_users.where(:id => user.id) +
        topic.category.moderator_users.where(:id => user.id)).blank?
  end

  def owner?(user)
    owner == user
  end

end

# == Schema Information
#
# Table name: questions
#
#  id                 :integer         not null, primary key
#  owner_id           :integer         not null
#  topic_id           :integer         not null
#  body               :text
#  answer_description :text
#  created_at         :datetime
#  updated_at         :datetime
#

