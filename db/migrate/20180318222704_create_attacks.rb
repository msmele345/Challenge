class CreateAttacks < ActiveRecord::Migration[5.1]
  def change
    create_table :attacks do |t|
      t.string :attack_name
      t.string :attack_type
      t.decimal :APS_impact
      t.decimal :DMG_impact
      t.string :element
      t.references :character 

      t.timestamps
    end
  end
end
