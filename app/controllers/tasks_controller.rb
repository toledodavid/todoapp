class TasksController < ApplicationController
  def edit
    @todolist = Todolist.find(params[:todolist_id])
    @task = Task.find(params[:id])
  end

  def create
    @todolist = Todolist.find(params[:todolist_id])
    @task = @todolist.tasks.create(task_params)
    redirect_to todolist_path(@todolist)
  end

  def update
    @todolist = Todolist.find(params[:todolist_id])
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to todolist_path(@todolist)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
