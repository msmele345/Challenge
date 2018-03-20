class Attack < ApplicationRecord
    has_many :damage_reports 
    has_many :weapon_combos, through: :damage_reports, source: :weapon
    belongs_to :character, optional: true 

    ##Attacks can optionally be tied to specific characters. This could come in use down the road if attacks that are unique to special characters are added.
    validates :attack_name, :uniqueness => true 
end
