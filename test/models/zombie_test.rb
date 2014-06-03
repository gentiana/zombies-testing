require 'test_helper'

class ZombieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @z = zombies(:tim)
    @loc = stub(latitude:2, longtitude:3)
  end
  
  should validate_presence_of(:name)
  should validate_presence_of(:graveyard)
  should validate_uniqueness_of(:name)
  should ensure_length_of(:name).is_at_least(3).is_at_most(20)
  should have_many(:tweets)
  
  test "invalid without a name" do
    z = Zombie.new
    assert !z.valid?, "Name is not being validated"
  end
  
  test "valid with all attributes" do
    z = zombies(:ala)
    assert z.valid?, "Zombie should be valid"
  end
  
  test "invalid name gives error message" do
    @z.name = nil
    assert_presence(@z, :name)
  end
  
  test "invalid graveyard gives error message" do
    @z.graveyard = nil
    assert_presence(@z, :graveyard)
  end
  
  test "can generate avatar_url" do
    assert_equal "http://zombitar.com/#{@z.id}.jpg", @z.avatar_url
  end
  
  test "should respond to tweets" do
    assert_respond_to @z, :tweets
  end
  
  test "should contain only tweets belonging to zombie" do
    assert @z.tweets.all? { |t| t.zombie == @z }
  end
  
  test "decapitate should set status to dead again" do
    @z.weapon.stubs(:slice)
    @z.decapitate
    assert_equal 'dead again', @z.status
  end
  
  test "decapitate should call slice" do
    @z.weapon.expects(:slice)
    @z.decapitate
  end
  
  test 'geolocate calls the Zoogle graveyard locator' do
    Tweet.expects(:locator).with(@z.graveyard).returns(@loc)
    @z.geolocate
  end
  
  test "geolocate returns properly formatted lat, long" do
    Tweet.stubs(:locator).with(@z.graveyard).returns(@loc)
    assert_equal '2, 3', @z.geolocate
  end
  
  test "decapitate should set status to dead again again" do
    zombie = FactoryGirl.build(:armed_zombie, status: 'dead')
    zombie.decapitate
    assert_equal "dead again", zombie.status
  end
  
end
