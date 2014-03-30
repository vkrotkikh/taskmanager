class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    #render text: @projects.map { |i| "Project with name #{i.name} and id #{i.id}"   }.join("<br/>")
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
    @project = Project.create(name: params[:name], id: params[:id])
    if @project.errors.empty?
       redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(name: params[:name])
    if @project.errors.empty?
       redirect_to project_path(@project)
    else
      render 'edit'
    end

  end

  def destroy

  end

end
