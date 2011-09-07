class User < ActiveRecord::Base
  set_table_name :user

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :exams

  has_many :my_categories, :class_name => "Category", :foreign_key => "owner_id"
  has_many :my_topics, :class_name => "Topic", :foreign_key => "owner_id"
  has_many :my_questions, :class_name => "Question", :foreign_key => "owner_id"

  has_many :access_levels
  has_many :access_categories, :through => :access_levels, :source => "obj", :source_type => "Category"
  has_many :access_topics, :through => :access_levels, :source => "obj", :source_type => "Topic"
  has_many :access_questions, :through => :access_levels, :source => "obj", :source_type => "Question"

  def has_admin?
    self.admin
  end

end

# == Schema Information
#
# Table name: user
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  admin                  :boolean         default(FALSE)
#

