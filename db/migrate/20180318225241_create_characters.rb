class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string  :name
      t.integer :level, default: 1
      t.string  :primary_attr
      t.string  :avatar_url
      t.references :user 
      t.references :fighter_class

      t.timestamps
    end
  end
end
