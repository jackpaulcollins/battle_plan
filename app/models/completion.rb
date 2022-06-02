class Completion < ApplicationRecord
  belongs_to :plan
  belongs_to :task
  belongs_to :user
  validates_presence_of :task
  validates_uniqueness_of :task, scope: :completed_on, message: "has already been completed for this day."

  def completed_for_day?(day)
    Completion.where(task: self.task_id, completed_on: day).exists?
  end
end
