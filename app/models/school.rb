class School < ApplicationRecord
  # Validations
  validates :name, uniqueness: true, presence: true
  validates_presence_of :address
  validates_presence_of :principal
  validates :capacity, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 52000}, presence: true

  validates_presence_of :private_school

  # Associations
  has_many :students, dependent: :destroy
end
