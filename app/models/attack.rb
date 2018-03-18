class Attack < ApplicationRecord
    has_many :damage_reports 
    has_many :used_weapons, through: :damage_reports, source: :weapon
end
