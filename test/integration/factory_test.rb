require 'test_helper'

class FactoryTest < ActionDispatch::IntegrationTest
  test 'should throw exception' do
    assert_raises ActiveRecord::RecordInvalid do
      zombie_1 = FactoryGirl.create(:zombie)
      zombie_2 = FactoryGirl.create(:zombie)
    end
  end
  
  test 'factory uniqueness' do
    zombie_1 = FactoryGirl.create(:zombie)
    zombie_2 = FactoryGirl.create(:zombie, name: 'Ash1')
  end
  
  test 'factory sequences' do
    zombie_1 = FactoryGirl.create(:undead)
    zombie_2 = FactoryGirl.create(:undead)
    100.times do
      FactoryGirl.create(:undead)
    end
  end
  
  test 'factory weapon' do
    skip
    3.times do
      [:armed_zombie, :hatchet_undead, :weapon, :hatchet].each do |factory|
        FactoryGirl.create(factory)
      end
    end
  end
  
end
