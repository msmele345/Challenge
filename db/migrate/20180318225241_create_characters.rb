class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.references :user 
      t.references :class 

      t.timestamps
    end
  end
end
