class ProjectsController < ApplicationController


  def index
    @projects = current_user.projects.sort_by_name
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find_by(id: params[:id])
    @tasks = current_user.tasks
    @projectOwnerEmail = User.find_by(id: @project.user_id).email
  end

  def edit
  end

  def create
    @project = Project.create(project_params)
    if @project.update(project_params.merge({user_id: current_user.id}))
       current_user.projects << @project
       redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def update
    if @project.update(project_params.merge({user_id: current_user.id}))
       redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def add_user_to
  end

private

def project_params
  params.require(:project).permit(:name)
end

def find_project
    @project = Project.find(params[:id])
end

end
