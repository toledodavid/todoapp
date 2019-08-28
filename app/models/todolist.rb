class Todolist < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, presence: true, format: { with: /\A[a-zA-Z0-9 ]+\z/, message: "only allows letters and numbers" }
end
