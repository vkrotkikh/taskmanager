class RegistrationController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #@user.name = params[:user][:name]
    #@user.password = params[:user][:password]
    #@user.email = params[:user][:email]

    if @user.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end





end
