class ProjectsUsersController < ApplicationController

  before_action :set_project

  def new
    @projects_user = ProjectsUser.new
    @projectList = User.all.map { |r|
      next if current_user.name==r.name || 
      r.projects_users.pluck(:project_id).include?(@project.id)
      [r.name, r.id] }
      @projectList = @projectList.compact
  end

  def create
    @projects_user = @project.projects_users.new(projects_users_params)
    if @projects_user.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end



  private

  def projects_users_params
    params.require(:projects_user).permit(:user_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
