class CreateFighterClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :fighter_classes do |t|
      t.string :name
      t.string :skill


      t.timestamps
    end
  end
end
