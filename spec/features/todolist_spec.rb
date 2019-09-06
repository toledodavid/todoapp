require 'rails_helper'

describe 'Todolist', type: :feature do
  let(:user) { create(:user) }
  before do
    login_as(user)
  end

  it 'redirect to show todolist after create a new todolist' do
    visit '/todolists/new'
    # byebug
    fill_in 'todolist[title]', with: 'Capybara title'
    find("input[type='submit']").click
    expect(page).to have_content('Capybara title')
  end
end
