class AddIndexToMission < ActiveRecord::Migration
  def change
    add_column :missions, :user_id, :integer
    add_index :missions, [:user_id, :created_at]
  end
end
