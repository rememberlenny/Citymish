class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectImage
      t.string :projectTitle
      t.string :category
      t.string :shortBlurb
      t.string :projectLocation
      t.integer :collectionDuration
      t.integer :participationGoal
      t.string :projectVideo
      t.text :projectDescription
      t.text :risksChallenges

      t.timestamps
    end
  end
end
