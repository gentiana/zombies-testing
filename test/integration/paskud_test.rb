require 'test_helper'

class PaskudTest < ActionDispatch::IntegrationTest
  test "anyone cat view zombie information" do
    zombie = zombies(:tim)
    # get zombie_url(zombie)
    visit zombie_url(zombie)
    
    # assert_response :success
    assert_equal zombie_path(zombie), current_path
    # assert_select "h1", zombie.name
    within('h1') do
      assert has_content?(zombie.name)
    end
  end
  
  test "navigations is avalaible to the zombie page" do
    tweet = FactoryGirl.create(:tweet)
    zombie = tweet.zombie
    visit root_url
    within("#tweet_#{tweet.id}") do
      click_link zombie.name
      assert_equal zombie_path(zombie), current_path
    end
  end
  
  test "should create a new zombie" do
    visit root_url
    click_link "Sign up"
    fill_in "Name", with: "Breins"
    fill_in "Graveyard", with: "BRREEEEIIINNNSSS"
    click_button "Sign up"
    assert_equal zombie_path(Zombie.last), current_path
  end
  
  test "should show a welcome message to new signups" do
    visit root_url
    sign_up_as 'Breins', "BRREEEEIIINNNSSS"
    assert has_content?("Welcome Breins"), "Message not displayed"
  end
end
