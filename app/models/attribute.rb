class Attribute < ApplicationRecord
    has_many :character_attributes 
    has_many :holding_characters, through: :character_attributes, :source => :character

    ##helper to show all of the characters that have a given attribute 
    
  
end
