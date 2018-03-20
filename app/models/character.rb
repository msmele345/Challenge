class Character < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :fighter_class 

    has_many :attacks 
    has_many :weapons 
    has_many :character_attributes, source: :attribute

    # validates :name, :uniqueness =>true 
    validates_numericality_of :level, greater_than: 1
    validates_numericality_of :level, less_than_or_equal_to: 90

end