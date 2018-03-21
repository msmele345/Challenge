class CharactersController < ApplicationController 

  def new 
    @new_character = Character.new
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