class Tweet < ActiveRecord::Base
  belongs_to :zombie
  
  class Coordinates
    attr_reader :latitude, :longtitude
    
    def initialize
      @latitude = 34
      @longtitude = 50.23
    end
  end
  
  def self.locator (graveyard)
    where 'status LIKE ?', graveyard
    Coordinates.new
  end
end
