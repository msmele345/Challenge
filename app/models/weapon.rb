class Weapon < ApplicationRecord
   has_many :damage_reports 
   has_many :attack_combos, through: :damage_reports, source: :attack

   validates :weapon_name, :uniqueness => true 
end
