module DamageReportsHelper 

  ##Method to parse the damage range of the weapon. Displayed as a hash
  def parse_dmg_range(range)
    number_array = range.split("-").map {|string_num| string_num.to_i }
    hash_display = {:min_damage => number_array[0], :max_damage => number_array[1]} 
  end 

  ##Helper to display all active characters on damage report create view  
  def grab_character_names
    characters = Character.all.pluck(:name)
    size = characters.length
    index_array = (0..size).to_a
    characters.zip(index_array)
  end

  def grab_attack_names
    attacks = Attack.all.pluck(:attack_name)
  end 

  def character_input(weapon_attr_modifier, level)
    total_character_damage = ((level * 10 ) + weapon_attr_modifier).to_f

  end 

  def calculate_min_damage(weapon_min, character_input, attack_dmg, element_boost, element_impact = nil)
    # ep element_impact
    element_dmg = element_boost / 100
    base_amount =  weapon_min * (character_input / 100) * (attack_dmg / 100)

    if element_impact 
      boost_amt = base_amount * element_dmg
      return base_amount + boost_amt
    end 
    base_amount < 1 ? base_amount * 100 : base_amount
  end 

  def calculate_max_damage(weapon_max, character_input, attack_dmg, element_boost, element_impact = nil)
    # ep element_impact
    ##Convert from % to decimal form 
    element_dmg = element_boost / 100 
    ##Total Attack
    base_amount =  weapon_max * (character_input / 100) * (attack_dmg / 100) 
    ##Add extra element damage if there is a match
    if element_impact 
      boost_amt = base_amount * element_dmg
      return base_amount + boost_amt
    end 
    base_amount < 1 ? base_amount * 100 : base_amount
  end 


  def calculate_damage_per_second(min_damage, max_damage, weapon)
    p "**************"
    # p weapon.APS 
    # p min_damage
    # p max_damage
    min_damage_per_second = min_damage * weapon.APS
    max_damage_per_second = max_damage * weapon.APS
    if weapon.APS > 1 
      # (min_damage_per_second + max_damage_per_second) / 2
      total =  (min_damage * weapon.APS) + (max_damage * weapon.APS)
      total / 2
    else 
      # return (min_damage + max_damage) / 2
    end 
  end 
  
end 