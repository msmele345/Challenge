module DamageReportsHelper 

  ##Method to parse the damage range of the weapon. Displayed as a hash
  def parse_dmg_range(range)
    number_array = range.split("-").map {|string_num| string_num.to_i }
    hash_display = {:min_damage => number_array[0], :max_damage => number_array[1]} 
  end 


  def character_input(weapon_attr_modifier, level)
    total_character_damage = ((level * 10 ) + weapon_attr_modifier).to_f

  end 

  def calculate_min_damage(weapon_min, character_input, attack_dmg, element_boost, element_impact = nil)
    element_dmg = element_boost / 100
    base_amount =  weapon_min * (character_input / 100) * (attack_dmg / 100)

    if element_impact 
      boost_amt = base_amount * element_dmg
      return base_amount + boost_amt
    end 
    base_amount < 1 ? base_amount * 100 : base_amount
  end 

  def calculate_max_damage(weapon_max, character_input, attack_dmg, element_boost, element_impact = nil)
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
    min_damage_per_second = min_damage * weapon.APS
    max_damage_per_second = max_damage * weapon.APS
    if weapon.APS > 1 
      # (min_damage_per_second + max_damage_per_second) / 2
      total =  (min_damage * weapon.APS) + (max_damage * weapon.APS)
      total / 2
    else 
      return (min_damage + max_damage) / 2
    end 
  end 



  def ToCell (tag,value)
    if value.instance_of?(String)
      value = value.split
    end 
    value.map{ |c| "<#{tag}>#{c}</#{tag}>" }.join   
  end

  def last_damage_report_table
    reports = DamageReport.first(3)
    attacks = Attack.all 
    table_array = []
    first_row = ["Attack","Minimum", "Maximum", "DPS"]
    reports.each_with_index do |report, index|
      damage_stats = [attacks[index][:attack_name], report.min_damage, report.max_damage, report.damage_per_second]
      table_array << damage_stats
    end 
    table_array.unshift(first_row)
  end 

  def all_damage_reports_table
    reports = DamageReport.all
    attacks = Attack.all 
    table_array = []
    first_row = ["Attack", "Creation Date:", "Minimum", "Maximum", "DPS"]
    reports.each_with_index do |report, index|
      damage_stats = [attacks[index][:attack_name], set_date(report.created_at), report.min_damage, report.max_damage, report.damage_per_second]
      table_array << damage_stats
    end 
    table_array.unshift(first_row)
  end 

  def ToTable (table_array, table_class)
    headers = "<tr>" + ToCell('th',table_array[0]) + "</tr>"
    cells = table_array[1..table_array.count].map{ |each_row|
        "<tr>#{ToCell('td',each_row)}</tr>"             
    }.join

    table = "<table class=\"#{table_class}\"><thead>#{headers}</thead><tbody>#{cells}</tbody></table>"
  end

  ##Helper to create array of all attributes saved in the system
  def list_attributes 
    attributes = Attribute.all 
    attributes.map {|attr| attr[:attr_name]}
  end 

  ##Helper to show a collection of saved fighter_class objects in the db to choose from on character creation 

  def list_fighter_classes
    classes = FighterClass.all 
    classes.map {|fighter_class| fighter_class[:name]}
  end 

  ##Helper to display all active characters on damage report create view  
  def grab_character_names
    characters = Character.all.pluck(:name)
  end
  
  def grab_attack_names
    attacks = Attack.all.pluck(:attack_name)
  end 

  def set_date(date)
    date.strftime("%m/%d/%y")
  end


end 