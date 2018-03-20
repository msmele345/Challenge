class DamageReportsController < ApplicationController 


    def index
      @reports = DamageReport.all.order(:created_at)
    end 

    def new 
      @damage_report = DamageReport.new
    end 


    def create
      @weapon = Weapon.new(weapon_params)      
      
      if @weapon.save 
        flash[:success] = "We noticed this is a new weapon. It has been successfully added to the database!"
      else  
        @weapon = Weapon.find_by(:weapon_name => params[:weapon_name])
      end 

      @character = Character.find_by(:name => params[:character_name])
      @damage_range = parse_dmg_range(params[:DMG_range])
      @character_input = character_input(@weapon.weapon_attr_modifier, @character.level)
      @attacks = grab_attack_names 
      @element_check = false


      @attacks.each do |attack_name| ## this wont work if attacks are deleted (indexes incorrect)
        attack = Attack.find_by(:attack_name => attack_name)
        attack_dmg = attack.DMG_impact
        # p "********"
        # ep @weapon.element_impact
        # ep attack.element
        ep attack
        if attack.element === @weapon.element_impact
          @element_check = true  
        end 

        p calculate_min_damage(@damage_range[:min_damage], @character_input, attack_dmg, @weapon.element_boost, @element_check )

        # damage_report = DamageReport.create!(:weapon_id => @weapon.id, :attack_id => attack.id, :min_damage => helper method, :max_damage => helper_method, :damage_per_second)
      end 

      # def calculate_min_damage(weapon_min, character_input, attack_dmg, element_boost, element_impact = nil)
      #   element_dmg = element_dmg / 10
      #   base_amount =  min_damage * character_input * attack_dmg
    
      #   if element_impact
      #     boost_amt = base_amount * element_dmg
      #     return base_amount + boost_amt
      #   else 
      #     return base_amount
      #  end 
      # end 

      redirect_to damage_reports_path
      ##TODO 
      ##FIX element boost 
      ##Create max algo 
      ##work on displays 
      ##Display all Damage reports on index page!
      ##display attacks as part of table 
      ##OR iterate through attacks. Setup if statements for name chaecks to apply defaults 
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