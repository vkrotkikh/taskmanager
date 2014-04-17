class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource param_method: :project_params

  def index
    @own_projects = current_user.own_projects.sort_by_name
    
    if !current_user.projects_users.empty?
      @assign_projects = Project.find_all_by_id(current_user.projects_users.pluck(:project_id))
    end
    @user_has_assign_projects = current_user.projects_users.pluck(:user_id).include?(current_user.id)
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find_by(id: params[:id])
    @tasks = @project.tasks
    @projectOwnerEmail = User.find_by(id: @project.owner_id).email
  end

  def edit
  end

  def create
    @project = Project.create(project_params)
    if @project.update(project_params.merge({owner_id: current_user.id}))
       current_user.own_projects << @project
       redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def update
    if @project.update(project_params)
       redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

private

  def project_params
    params.require(:project).permit(:name)
  end

  def find_project
      @project = Project.find(params[:id])
  end

end
