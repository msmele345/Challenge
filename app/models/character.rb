class Character < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :fighter_class , optional: true

    has_many :attacks 
    has_many :weapons 
    # has_many :personal_attributes, :class_name => "Attribute"


    has_many :character_attributes
    has_many :char_attributes, through: :character_attributes, source: :char_attribute
    ##Naming collision with keyword. I'll need to research advanced associates again to rename. I believe this should be a join table between characters and attributes 

    validates :name, :uniqueness => true 
    validates_numericality_of :level, greater_than: 1
    validates_numericality_of :level, less_than_or_equal_to: 90

end

##TODO
##Create process page 
##Clean up controllers and check for extra comments 
##user show with user characters 
##heroku?