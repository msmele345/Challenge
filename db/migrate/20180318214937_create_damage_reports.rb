class CreateDamageReports < ActiveRecord::Migration[5.1]
  def change
    create_table :damage_reports do |t|
      t.decimal :min_damage
      t.decimal :max_damage
      t.decimal :damage_per_second
      t.references :weapon
      t.references :attack

      t.timestamps
    end
  end
end
