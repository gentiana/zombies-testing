class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :ammo
      t.integer :zombie_id

      t.timestamps
    end
  end
end
