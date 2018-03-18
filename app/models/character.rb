class Character < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :fighter_class 

    has_many :attacks 
    has_many :weapons 
    has_many :attributes 

end
