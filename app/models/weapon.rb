class Weapon < ApplicationRecord
   has_many :damage_reports 
   has_many :attack_combos, through: :damage_reports, source: :attack
end
