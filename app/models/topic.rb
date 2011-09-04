class Topic < ActiveRecord::Base

  belongs_to :category
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :exams
  has_many :questions

  validates :name, :presence => true,
            :length => {:within => 4..50}

  validates :questions_limit, :numericality => true,
            :inclusion => {:in => 16..60}

  validates :time_limit, :numericality => true,
            :inclusion => {:in => 960..3600}

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
#  time_limit      :integer         default(960), not null
#  created_at      :datetime
#  updated_at      :datetime
#

# == Schema Information
#
# Table name: topics
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  category_id     :integer         not null
#  owner_id        :integer         not null
#  questions_limit :integer         default(16), not null
#  time_limit      :integer         default(960), not null
#  created_at      :datetime
#  updated_at      :datetime
#

