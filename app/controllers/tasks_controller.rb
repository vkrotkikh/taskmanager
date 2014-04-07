class TasksController < ApplicationController


  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def show

  end

  def edit

  end

  def create
    @task = Task.create(task_params)
    if @task.update(task_params.merge({user_id: current_user.id}))
       redirect_to root_path
    else
      render 'edit'
    end
  end

  def update
  end

  def destroy
  end

  private

	def task_params
	  params.require(:task).permit(:name, :description)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
