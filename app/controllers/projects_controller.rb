class ProjectsController < ApplicationController


  def index
    @projects = current_user.projects.sort_by_name
    #render text: @projects.map { |i| "Project with name #{i.name} and id #{i.id} and user_id #{i.user_id}"   }.join("<br/>")
  end

  def new
    @project = Project.new
  end

  def show
    unless @project = Project.where(id: params[:id]).first
      render text: 'Page not found', status: 404
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.create(project_params)
    if @project.update(project_params.merge({user_id: current_user.id}))
       current_user.projects << @project
       redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params.merge({user_id: current_user.id}))
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


  private

  def project_params
    params.require(:project).permit(:name)
  end

end
