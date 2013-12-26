class RemoveMissions < ActiveRecord::Migration
  def change
    drop_table :missions
  end
end
