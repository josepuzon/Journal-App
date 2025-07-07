class Task < ApplicationRecord
  belongs_to :category
  delegate :user, to: :category

  validates :title, presence: true
end
