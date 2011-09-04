require 'factory_girl'

Factory.sequence :email do |n|
  "user_#{n}@example.com"
end

Factory.sequence :category_name do |n|
  "test category #{n+1}"
end

Factory.define :user do |user|
  user.name 'Test User'
  user.email "user@example.com"
  user.password 'please'
end

Factory.define :category do |category|
  category.name "new category"
  category.association :owner
end

Factory.define :topic do |topic|
  topic.name "new exam type"
  topic.association :owner
  topic.association :category
end

