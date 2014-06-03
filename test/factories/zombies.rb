# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :zombie do
    name "Ash"
    graveyard "Oak Park"
    
    factory :zombie_bill do
      name 'Bill'
    end
    
    factory :undead do
      sequence(:name) { |i| "Ash#{i}" }
      
      factory :hatchet_undead do
        association :weapon, factory: :hatchet
      end
    end
    
    factory :zombie_mike do
      name 'Mike'
      graveyard 'Sunnyvale'
    end
  end
  
  factory :armed_zombie, class: Zombie do
    sequence(:name) { |i| "ArmedAsh#{i}" }
    graveyard "Oak Park"
    association :weapon
  end
end
