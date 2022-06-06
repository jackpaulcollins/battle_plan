class Plan < ApplicationRecord
  include PlanConcern
  belongs_to :user
  has_many :completions, as: :completable
  before_destroy { self.completions.destroy_all }
  has_many :tasks, dependent: :delete_all
  validates_presence_of :title

  def completed_for_day?(day)
    self.completions.where(completed_on: day).exists?
  end
end
