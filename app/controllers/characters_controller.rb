class CharactersController < ApplicationController 

  before_action :redirect_unless_logged_in

  def new 
    @new_character = Character.new
  end 

  def index 
    @characters = Character.all.order(:created_at)
  end 

  def create 
    @new_character = Character.new(character_params)
    ##Set the owner (user) of the character
    @new_character.user_id = current_user.id
    ## Take the params string and Find the attribute object in the db
    @primary_attribute = Attribute.find_by(:attr_name => params[:character][:primary_attr])
    ##Take the params string and Find the Fighter Class object 
    @fighter_class = FighterClass.find_by(:name => params[:character][:fighter_class_id])
    ##Assign the fighter class that the character belongs too
    @new_character.fighter_class_id = @fighter_class.id

    if @new_character.save 
      ##assign attribute object to characers attributes collection
      @new_character.character_attributes << @primary_attribute
      flash[:success] = "Character has been saved! Let's test some weapons..."
      redirect_to root_path
    else 
      @errors = @new_character.errors.full_messages
      render :new
    end 

  end 

  def show 
    ##Future Implementation : Character bio/profile page
  end 

  def edit   
    @character = Character.find_by(:id => params["id"])
  end 

  def update 
    @character = Character.find_by(:id => params["id"])   
    if @character.update_attributes(non_fighter_params)
      @fighter_class = FighterClass.find_by(:name => params[:character][:fighter_class_id])
      ##Assign the fighter class that the character belongs too if changed
      @character.update_attribute(:fighter_class_id, @fighter_class.id)
      flash[:success] == "Character Updated"
      redirect_to characters_path
    else 
      @errors = @character.errors.full_messages
      render :edit
    end 
  end 

  def destroy
    character_id = params["id"]
    @character = Character.find_by(id: params["id"])
    @character.destroy
    redirect_to characters_path
  end

  private 

  def character_params
    params.require(:character).permit(:name, :level, :primary_attr, :avatar_url, :user_id, :fighter_class_id)
  end 

  def non_fighter_params 
    params.require(:character).permit(:name, :level, :primary_attr, :avatar_url)
  end 


end 