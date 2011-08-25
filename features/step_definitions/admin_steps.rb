Given /I am admin/ do
  User.new(:name => "admin",
           :email => "admin@example.com",
           :password => "password",
           :password_confirmation => "password",
           :admin => true).save!
end

Given /^I am sign in by admin role$/ do
  Given %{I go to the sign in page}
  And %{I sign in as "admin@example.com/password"}
end

Given /^Create new Exam category '(.*)'$/ do |name|
  ExamCategory.new(:name => name).save!
end

Given /^Create new Exam Type '(.*)\((\d+) level\)' for exam category '(.*)'$/ do |exam_name, level, exam_category|
  category = ExamCategory.find_by_name(exam_category)
  category.should_not be_nil
  exem_level = ExemLevel.find_by_level(level) || ExemLevel.create(:level => level)
  ExamType.new(:exam_category_id => category.id,
               :exam_level_id => exam_level.id).save!
end

Given /^Create question '(.*)' for exam '(.*)\((\d+) level\)':$/ do |question, exam_name, level, table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end