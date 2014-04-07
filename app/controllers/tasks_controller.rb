class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def show
  end

  def edit
  end

  def create
    @task = Task.create(task_params)
    if @task.update(task_params.merge({ user_id: current_user.id }))
       redirect_to root_path
    else
      render 'new'
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

end
