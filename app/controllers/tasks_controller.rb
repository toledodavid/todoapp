class TasksController < ApplicationController
  def create
    @todolist = Todolist.find(params[:todolist_id])
    @task = @todolist.tasks.create(task_params)
    redirect_to todolist_path(@todolist)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
