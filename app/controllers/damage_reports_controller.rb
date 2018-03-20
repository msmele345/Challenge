class DamageReportsController < ApplicationController 


    def index
      @reports = DamageReport.all.order(:created_at)
    end 

    def new 
      @damage_report = DamageReport.new
    end 

    def create
      ##NEED CONTROLL FLOW logic for weapons not saving to prevent dupes 
      @weapon = Weapon.create!(weapon_params)
      @character = Character.find_by(:name => params[:character_name])
      @attacks = grab_attack_names ## zip this with a plucked index value array

      @attacks.each_with_index do |attack_name, index| ## this wont work if attacks are deleted (indexes incorrect)
        @damage_report = DamageReport.create!(:weapon_id => @weapon.id, :attack_id => index :min_damage => helper method, :max_damage => helper_method, :damage_per_second)

      redirect_to damage_reports_path
      ##TODO 
      ##EACH ATTACK IS ITS OWN DAMAGE REPORT
      ##Display all Damage reports on index page!
      ##display attacks as part of table 
      ##iterate of both with each with index? 
      ##OR iterate through attacks. Setup if statements for name chaecks to apply defaults 
      ##start making helpers for algos
    end 

    def destroy 
    end 

    private 
    
    def weapon_params 
      params.permit(:weapon_type, :DMG_range, :APS, :weapon_attr_modifier, :element_impact, :element_boost, :character_id)
    end 

    def character_params
      params.permit(:character_name, :experience_level)
    end 

end 