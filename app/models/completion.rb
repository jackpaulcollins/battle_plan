class Completion < ApplicationRecord
  belongs_to :user
  belongs_to :completable, polymorphic: true
  validates_presence_of :completable_id
end
