class Attack < ApplicationRecord
    belongs_to :character, optional: true 
    ##Attacks can optionally be tied to specific characters. This could come in use down the road if attacks that are unique to special characters are added.
end
