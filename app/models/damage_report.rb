class DamageReport < ApplicationRecord
    belongs_to :weapon
    belongs_to :attack 
end
