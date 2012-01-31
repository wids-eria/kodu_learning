# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    sequence(:title)  {|n| "assignment#{n}" }
    description "MyText"
  end
end
