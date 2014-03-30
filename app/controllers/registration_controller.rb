class RegistrationController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.email = params[:user][:email]

    if @user.errors.blank?
      @user.save
      redirect_to projects_path
    else
      render 'new'
    end
  end





end
