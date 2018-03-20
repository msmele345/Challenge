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
    # p weapon_min
    # p character_input
    # p attack_dmg
    # p element_boost
    ep element_impact
    element_dmg = element_boost / 100
    base_amount =  weapon_min * (character_input / 100) * (attack_dmg / 100)

    if element_impact 
      boost_amt = base_amount * element_dmg
      return base_amount + boost_amt
    end 
    base_amount < 1 ? base_amount * 100 : base_amount
  end 

  def calculate_max_damage(max_damage, character_level, attack_dmg)
    
  end 



  ##Initial Math Helpers for 3 known attacks: 

  def punch_attack
  end 

  def fire_attack
  end 

  def cold_attack 
  end 
  
end 