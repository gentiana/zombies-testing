# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    status "i need braaaaaaaaaaaaa"
    association :zombie
  end
end
