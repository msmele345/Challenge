class DamageReportsController < ApplicationController 

    before_action :redirect_unless_logged_in

    def index
      @reports = DamageReport.all.order(:created_at)
    end 

    def new 
      @damage_report = DamageReport.new
    end 


    def create
      #Identify the Character from Params     
      @character = Character.find_by(:name => params[:character_name])
      ##Call helper to grab an array of all the current attack object names from the db
      @attacks = grab_attack_names 
      ##If the weapon passes unique validation, the weapon is saved to the db. Otherwise, its located by the weapon name from params
      @weapon = Weapon.new(weapon_params)  
      if @weapon.save 
        flash[:success] = "We noticed this is a new weapon. It has been successfully added to the database!"
      else  
        @weapon = Weapon.find_by(:weapon_name => params[:weapon_name])
      end 

      @damage_range = parse_dmg_range(params[:DMG_range])
      @character_input = character_input(@weapon.weapon_attr_modifier, @character.level)
      


      @attacks.each do |attack_name| 
        attack = Attack.find_by(:attack_name => attack_name)
        attack_dmg = attack.DMG_impact
        @element_check = false
  
        if attack.element === @weapon.element_impact
          @element_check = true  
        end 
        
        min_damage = calculate_min_damage(@damage_range[:min_damage], @character_input, attack_dmg, @weapon.element_boost, @element_check)
        
        max_damage = calculate_max_damage(@damage_range[:max_damage], @character_input, attack_dmg, @weapon.element_boost, @element_check)

        damage_per_second = calculate_damage_per_second(min_damage, max_damage, @weapon)
        
        damage_report = DamageReport.create!(:weapon_id => @weapon.id, :attack_id => attack.id, :min_damage => min_damage, :max_damage => max_damage, :damage_per_second => damage_per_second)
      end 

      redirect_to damage_reports_path

    end 

    def destroy 
    end 


    private 
    def weapon_params 
      params.permit(:weapon_name, :weapon_type, :DMG_range, :APS, :weapon_attr_modifier, :element_impact, :element_boost, :character_id)
    end 

    def character_params
      params.permit(:character_name, :experience_level)
    end 

end 