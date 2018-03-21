class CharactersController < ApplicationController 

  def new 
    @character = Character.new
  end 

  def create 
    p "*******"
    ep params 
    ##set user id 
    ##find_by "Fighter name" to to find fighter class 
    ##complete edit and update 

  end 

  def show 
  end 

  def edit 
  end 

  def update 
  end 

  def destroy
  end 

  private 

  def character_params
    params.require(:character).permit(:name, :level, :primary_attr, :avatar_url, :user_id, :fighter_class_id)
  end 


end 