class AttributesController < ApplicationController


    def new 
      @attack = Attribute.new
    end 
  
    def index 
      @attributes = Attribute.all
    end 
  
    def create 

      @attribute = Attribute.new(attribute_params)
      ##Find character by name from form menu 
      @character = Character.find_by(name: params[:character_id])
      ep @character
      ##Assign attribute to specific character
      @attribute.character_id = @character.id

  
      if @attribute.save
        flash[:success] = "Attribute Successfully Created"
        redirect_to attributes_path
      else 
        @errors = @attribute.errors.full_messages
        render :new
      end 
    end 
  
  
    def destroy 
      @attribute = Attribute.find(params[:id])
      @attribute.destroy
      redirect_to attributes_path
    end 
  
    private 
    def attribute_params
      params.permit(:attr_name, :attr_level)
    end

    def character_params 
      params.permit(:character_id)
    end 

end
