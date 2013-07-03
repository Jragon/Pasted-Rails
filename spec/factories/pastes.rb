# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :paste do
    name "MyString"
    content "MyText"
    language_id "MyString"
  end
end
