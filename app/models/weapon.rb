class Weapon < ApplicationRecord
   has_many :damage_reports 
   validates :weapon_name, :uniqueness => true 
end
