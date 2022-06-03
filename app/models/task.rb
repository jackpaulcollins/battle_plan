class Task < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :completions, as: :completable

  def completed_for_day?(day)
    self.completions.where(completed_on: day).exists?
  end
end
