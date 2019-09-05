require 'rails_helper'

RSpec.describe TodolistsController, type: :controller do
  login_user

  it { should use_before_action(:authenticate_user!) }

  it 'is valid with a title' do
    # user = create(:user)
    todolist = subject.current_user.todolists.new(title: 'Title example')
    expect(todolist).to be_valid
  end

  it 'is invalid without title' do
    todolist = subject.current_user.todolists.new(title: '')
    todolist.valid?
    expect(todolist.errors[:title]).to include("can't be blank")
  end

  it 'is invalid with special characters in the title' do
    todolist = subject.current_user.todolists.new(title: '.$%&-')
    todolist.valid?
    expect(todolist.errors[:title]).to include("only allows letters and numbers")
  end

  context 'GET #index' do
    it 'return a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  context 'GET #show' do
    it 'return a success response' do
      todolist = subject.current_user.todolists.create(title: 'Title example1')
      get :show, params: { id: todolist.to_param }
      expect(response).to be_successful
    end
  end

  context 'GET #edit' do
    it 'return a success response' do
      todolist = subject.current_user.todolists.create(title: 'Title example1')
      get :edit, params: { id: todolist.to_param }
      expect(response).to be_successful
    end
  end

  context 'POST #create' do
    let!(:todolist) { FactoryBot.create(:todolist, user: subject.current_user) }

    it 'create a new todolist' do
      params = {
        title: 'Title 1'
      }
      expect { post(:create, params: { todolist: params }) }.to change(Todolist, :count).by(1)
      expect(flash[:notice]).to eq 'Todolist was successfully created.'
    end
  end
end
