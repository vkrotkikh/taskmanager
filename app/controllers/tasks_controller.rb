class TasksController < ApplicationController

  before_action :find_project, :find_task

  def new
    @task = Task.new
  end

  def show 
  end

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
    @task.update(task_params)
    if @task.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@project)
  end

  private

  def find_task
    @task = @project.tasks.find_by(id: params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end

end
