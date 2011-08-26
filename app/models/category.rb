class Category < ActiveRecord::Base

  has_many :exam_types
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :access_levels

  validates :name, :presence => true,
            :uniqueness => {:case_sensitive => false},
            :length => {:within => 1..20}

end


# == Schema Information
#
# Table name: exam_categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  owner_id   :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

