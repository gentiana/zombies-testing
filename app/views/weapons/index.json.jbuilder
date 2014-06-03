json.array!(@weapons) do |weapon|
  json.extract! weapon, :id, :name, :ammo, :zombie_id
  json.url weapon_url(weapon, format: :json)
end
