class AddStatusToZombie < ActiveRecord::Migration
  def change
    add_column :zombies, :status, :string
  end
end
