# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



##The Warrior FighterClass that Lena is from 
fighter_class = {:name => "Warrior", :skill => "Melee Attacks"}

FighterClass.create!(fighter_class)

##Lena The Warrior (Character)

character = {:name => "Lena",
             :level => 10, 
             :primary_attr => "STR",
             :avatar_url => "http://rpgcodex.net/phpBB/images/avatars/gallery/Armageddon%20Empires/EOM08.jpg",
             :user_id => 1,
             :fighter_class_id => 1
}

Character.create!(character)

##Character Attributes 

strength = {:attr_name => "Strength",
            :attr_level => 10,
            :character_id => 1
}

vitality = {:attr_name => "Strength",
            :attr_level => 5,
            :character_id => 1
}

Attribute.create!(strength)
Attribute.create!(vitality)

##ATTACKS
##Punch Attack
punch = {:attack_name => "Plain-Old",
         :attack_type => "Punch", 
         :APS_impact => 1, 
         :DMG_impact => 1, 
         :element => "Physical", 
         :character_id => 1
}

Attack.create!(punch)

##Firemost Smite Attack 
smite = {:attack_name => "Firemost Smite",
         :attack_type => "Smite",
         :APS_impact => 120,
         :DMG_impact => 90,
         :element => "Fire",
         :character_id => 1
}

Attack.create!(smite)

##Frosty Cleave

cleave = {:attack_name => "Frosty Cleave",
          :attack_type => "Cleave",
          :APS_impact => 90,
          :DMG_impact => 120,
          :element => "Cold",
          :character_id => 1
}

Attack.create!(cleave)

##Example Weapon 
weapon = {:weapon_type => "Axe",
          :DMG_range => "50-65",
          :weapon_attr_modifier => 20,
          :element_boost => 10,
          :element_impact => "Fire",
          :character_id => 1
}

Weapon.create!(weapon)