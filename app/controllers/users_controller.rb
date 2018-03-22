class UsersController < ApplicationController

  before_action :redirect_unless_logged_in, only: [:show, :edit, :update]

    def new
      @user = User.new
    end

    def show 
      @user = User.find(params[:id])
    end 
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome to the Armory! Let's Test Some Weapons!"
        redirect_to user_path
      else
        @errors = @user.errors.full_messages
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end 

 
    def update 
      @user = User.find_by(:id => params[:id])   
      if @user.update_attributes(user_params)
        flash[:success] == "User Updated"
        redirect_to user_path(@user.id)
      else 
        @errors = @user.errors.full_messages
        render :edit
      end 
    end 
  
  
    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
  
  end