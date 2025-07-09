class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :name, presence: true
  validates :description, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["tasks", "user"]
  end
end
