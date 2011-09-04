class Category < ActiveRecord::Base

  has_many :topics
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :access_levels

  validates :name, :presence => true,
            :uniqueness => {:case_sensitive => false},
            :length => {:within => 1..45}

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

