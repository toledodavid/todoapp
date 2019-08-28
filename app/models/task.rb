class Task < ApplicationRecord
  belongs_to :todolist
  validates :title, :description, presence: true, format: { with: /\A[a-zA-Z0-9 ]+\z/, message: "only allows letters and numbers" }

  def self.to_csv(fields = column_names)
    CSV.generate(headers: true) do |csv|
      csv << fields
      all.each do |task|
        csv << task.attributes.values_at(*fields)
      end
    end
  end
end
