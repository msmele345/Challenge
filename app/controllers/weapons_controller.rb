class WeaponsController < ApplicationController 

    def new 
      @weapon = Weapon.new
    end 

    def index 
      @weapons = Weapon.all
    end 

    def create 

      
    end 


    def destroy
    @weapon = Weapon.find_by(id: params["id"])
    @weapon.destroy
    redirect_to characters_path
  end
end 