class CreateCharacterAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :character_attributes do |t|
      t.references :character
      t.references :char_attribute 

      t.timestamps
    end
  end
end
