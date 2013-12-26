class CreateMissionsNew < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.string :description
      t.string :content
      t.integer :user_id
      t.timestamps
    end
    add_index :missions, [:user_id, :created_at]
  end
end
