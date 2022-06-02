class Task < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :completions, dependent: :delete_all
end
