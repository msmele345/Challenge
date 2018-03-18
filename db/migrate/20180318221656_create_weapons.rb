class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.string :type
      t.string :DMG_range
      t.decimal :APS
      t.decimal :element_boost
      t.references :character 


      t.timestamps
    end
  end
end
