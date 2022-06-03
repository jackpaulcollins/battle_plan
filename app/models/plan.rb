class Plan < ApplicationRecord
  belongs_to :user
  has_many :completions
  before_destroy { self.completions.destroy_all }
  has_many :tasks, dependent: :delete_all
end
