class Zombie < ActiveRecord::Base
  has_many :tweets
  has_one :weapon
  
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }, uniqueness: true
  validates :graveyard, presence: true
  
  def avatar_url
    "http://zombitar.com/#{id}.jpg"
  end
  
  def decapitate
    weapon.slice(self, :head)
    self.status = 'dead again'
  end
  
  def geolocate
    loc = Tweet.locator(graveyard)
    "#{loc.latitude}, #{loc.longtitude}"
  end
end
