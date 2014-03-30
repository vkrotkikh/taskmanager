class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    unless @user = User.where(id: params[:id]).first
      render text: 'Page not found', status: 404
    end
  end

  def new
    User.new
  end

  def create
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], role:params[:role])
    if @user.errors.empty?
      redirect_to user_path(@user)
    else
      render 'new'
    end

  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(name: params[:name], email: params[:email], password: params[:password], role: params[:role])
    if @user.errors.empty?
      redirect_to user_path(@user)
    else
      render 'edit'
    end

  end

  def edit
    @user = User.find(id: params[:id])
  end

  def destroy

  end

end
