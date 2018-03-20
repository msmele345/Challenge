module DamageReportsHelper 

  def parse_dmg_range(range)
    range.split
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



  ##Initial Math Helpers for 3 known attacks: 

  def punch_attack
  end 

  def fire_attack
  end 

  def cold_attack 
  end 
  
end 