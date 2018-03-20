class DamageReportsController < ApplicationController 


    def index
      @reports = DamageReport.all.order(:created_at)
    end 

    def new 
      @damage_report = DamageReport.new
    end 

    ##Identify and Save weapon from form params 
    ##Identify Character from character params 
    ##Call grab_attack_names from helpers to create array of all current attack names 
    ##Iterate over 

    def create
      @weapon = Weapon.new(weapon_params)      
      
      if @weapon.save 
        flash[:success] = "We noticed this is a new weapon. It has been successfully added to the database!"
      else  
        @weapon = Weapon.find_by(:weapon_name => params[:weapon_name])
      end 

      @character = Character.find_by(:name => params[:character_name])
      @attacks = grab_attack_names 

      @attacks.each do |attack_name| ## this wont work if attacks are deleted (indexes incorrect)
        attack = Attack.find_by(:attack_name => attack_name)
        # p"**********"
        # p attack_index
        # damage_report = DamageReport.create!(:weapon_id => @weapon.id, :attack_id => attack.id, :min_damage => helper method, :max_damage => helper_method, :damage_per_second)
      end 

      redirect_to damage_reports_path
      ##TODO 
      ##EACH ATTACK IS ITS OWN DAMAGE REPORT
      ##Display all Damage reports on index page!
      ##display attacks as part of table 
      ##Show APS legend on the left side bar of damage new 

      ##OR iterate through attacks. Setup if statements for name chaecks to apply defaults 
      ##start making helpers for algos
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