class Attribute < ApplicationRecord
    belongs_to :character, optional: true 
end
