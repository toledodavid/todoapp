require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  login_user

  it 'is invalid with special characters in the title' do
    todolist = subject.current_user.todolists.new(title: '.$%&-')
    todolist.valid?
    task = todolist.tasks.new(title: '&%$sdcs', description: 'description example')
    task.valid?
    expect(task.errors[:title]).to include('only allows letters and numbers')
  end

  it 'is invalid with special characters in the description' do
    todolist = subject.current_user.todolists.new(title: '.$%&-')
    todolist.valid?
    task = todolist.tasks.new(title: 'Title 1', description: 'description #cdd&v $')
    task.valid?
    expect(task.errors[:description]).to include('only allows letters and numbers')
  end
end
