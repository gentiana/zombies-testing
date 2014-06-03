# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weapon do
    name "Broadsword"
    ammo 1
    association :zombie
    
    factory :hatchet do
      name "Hatchet"
    end
  end
end
