class CreateDamageReports < ActiveRecord::Migration[5.1]
  def change
    create_table :damage_reports do |t|
      t.float :min_damage
      t.float :max_damage
      t.float :damage_per_second
      t.references :weapon
      t.references :attack

      t.timestamps
    end
  end
end
