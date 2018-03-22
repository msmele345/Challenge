class CharacterAttribute < ApplicationRecord
  belongs_to :character, optional: true 
  belongs_to :char_attribute, class_name: "Attribute"
end
