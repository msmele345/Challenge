class DamageReportsController < ApplicationController 


    def index
      @reports = DamageReport.all.order(:created_at)
    end 

    def new 
      @damage_report = DamageReport.new
    end 

    def create
      @weapon = Weapon.create!(weapon_params)
      @character = Character.find_by(:name => params[:character_name])
      @attacks = grab_attack_names

      ##damage report has many attacks - one to many. Might need to fix 
      # @damage_report = DamageReport.new(:weapon_id => @weapon.id, :min_damage => helper method, :max_damage => helper_method, :damage_per_second)


      redirect_to new_damage_report_path
      ##TODO 
      ##Figure out Attacks association 
      ##display attacks as part of table 
      ##iterate of both with each with index? 
      ##start making helpers for algos

      # @damage_report = DamageReport.new(params[:])

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