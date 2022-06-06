class Task < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :completions, as: :completable
  validates_presence_of :description

  def completed_for_day?(day)
    self.completions.where(completed_on: day).exists?
  end
end
