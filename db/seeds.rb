
User.destroy_all
Category.destroy_all
Topic.destroy_all

admin = User.create!(:name => 'admin', :email => 'admin@example.com',
                     :password => 'password', :password_confirmation => 'password')
admin.admin = true
admin.save

i_am = User.create!(:name => 'Robert Hromej', :email => 'robert.hromej@gmail.com',
                    :password => 'password', :password_confirmation => 'password')
exam_categories = []
%w[Ruby Java C++ C# HTML CSS RubyOnRails JavaScript MySQL Ajax JQuery Prototype SCSS ActiveRecord].each do |category|
  exam_categories << Category.create!(:name => category, :owner => admin)
end

exam_categories.each do |exam_category|
  max_level = rand(5)+3
  max_level.times do |i|
    Topic.create!(:name => "#{exam_category.name} core(#{i+1} level)",
                     :category => exam_category,
                     :owner => admin)
  end
end

