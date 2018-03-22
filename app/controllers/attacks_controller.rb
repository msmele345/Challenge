class AttacksController < ApplicationController

  def new 
    @attack = Attack.new
  end 

  def index 
    @attacks = Attack.all
  end 

  def create 
    @attack = Attack.new(attack_params)

    if @attack.save
      flash[:success] = "Attack Successfully Created"
      redirect_to attacks_path 
    else 
      @errors = @attack.errors.full_messages
      render :new
    end 
  end 


  def destroy 
    @attack = Attack.find(params[:id])
    @attack.destroy
    redirect_to attacks_path
  end 

  private 
  def attack_params
    params.require(:attack).permit(:attack_name, :attack_type, :APS_impact, :DMG_impact, :element, :character_id )
  end
end
