require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

#Factory.define :exam_category do |ec|
#  ec.name 'test exam category'
#  ec.owner Factory(:user)
#end

