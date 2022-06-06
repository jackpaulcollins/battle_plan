class Completion < ApplicationRecord
  belongs_to :user
  belongs_to :completable, polymorphic: true
  validates_presence_of :completable_id
  validates :completed_on, uniqueness: { scope: :completable_id, message: "Already completed." }
end
