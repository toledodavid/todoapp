require 'rails_helper'

RSpec.describe Todolist, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:tasks).class_name('Task') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
