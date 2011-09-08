User.destroy_all
Category.destroy_all
Topic.destroy_all
Question.destroy_all
Answer.destroy_all

admin = User.create!(:name => 'admin', :email => 'admin@example.com',
                     :password => 'password', :password_confirmation => 'password')
admin.admin = true
admin.save

i_am = User.create!(:name => 'Robert Hromej', :email => 'robert.hromej@gmail.com',
                    :password => 'password', :password_confirmation => 'password')

#%w[Ruby Java C++ C# HTML CSS RubyOnRails JavaScript MySQL Ajax JQuery Prototype SCSS ActiveRecord].each do |category|
%w[Ruby Java C++ MySQL].each do |category|
  Category.create!(:name => category, :owner => admin)
end

categories = Category.all

categories.each do |category|
  max_level = 3
  max_level.times do |i|
    Topic.create!(:name => "#{category.name} core(#{i+1} level)",
                  :category => category,
                  :owner => admin)
  end
end

topics = Topic.all

topics.each do |topic|
  question_count = 6
  question_count.times do |i|
    Question.create!(:body => "question: a > b ??? #{i+1}",
                     :topic => topic,
                     :owner => admin)
  end
end

questions = Question.all

questions.each do |question|
  answer_count = 3
  answer_count.times do |i|
    Answer.create!(:body => "it is answer for your question ##{i+1}",
                   :question => question,
                   :is_true => rand(7)%2)
  end
end

