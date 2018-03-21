class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.string :weapon_type
      t.string :DMG_range
      t.float :APS
      t.float :weapon_attr_modifier
      t.string  :element_impact
      t.float :element_boost, :default => 0
      t.references :character 


      t.timestamps
    end
  end
end
