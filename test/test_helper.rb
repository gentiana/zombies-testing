ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  def assert_presence(model, field)
    model.valid?
    assert_match /can't be blank/, model.errors[field].join, "Error not found for #{field} in #{model.class}"
  end
  
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
  
  def sign_up_as(name, graveyard)
    click_link "Sign up"
    fill_in "Name", with: name
    fill_in "Graveyard", with: graveyard
    click_button "Sign up"
  end
end
