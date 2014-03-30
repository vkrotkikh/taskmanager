class ProjectsController < ApplicationController

  def index
    @projects = Project.where(user_id: current_user.id)
    #render text: @projects.map { |i| "Project with name #{i.name} and id #{i.id} and user_id #{i.user_id}"   }.join("<br/>")
  end

  def show
    unless @project = Project.where(id: params[:id]).first
      render text: 'Page not found', status: 404
    end
  end

  def new
    Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.create(name: params[:project][:name], user_id: current_user.id)
    if @project.errors.empty?
       redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(name: params[:project][:name])
    if @project.errors.empty?
       redirect_to project_path(@project)
    else
      render 'edit'
    end

  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

end
