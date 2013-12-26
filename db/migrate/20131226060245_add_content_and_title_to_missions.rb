class AddContentAndTitleToMissions < ActiveRecord::Migration
  def change
   add_column :missions, :title, :string
   add_column :missions, :shortDescription, :string
   add_column :missions, :longDescription, :string
   add_column :missions, :numberParticipants, :integer
   add_column :missions, :dateEndingMission, :string
  end
end
