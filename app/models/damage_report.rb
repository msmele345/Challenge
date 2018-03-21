class DamageReport < ApplicationRecord
    belongs_to :weapon
    belongs_to :attack, optional: true 
    # has_many :attacks 
end
