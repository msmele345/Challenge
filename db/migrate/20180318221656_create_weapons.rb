class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.string :weapon_type
      t.string :DMG_range
      t.decimal :APS
      t.decimal :weapon_attr_modifier
      t.string  :element_impact
      t.decimal :element_boost, :default => 0
      t.references :character 


      t.timestamps
    end
  end
end
