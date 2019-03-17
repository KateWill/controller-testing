class Student < ApplicationRecord
  # Validations
  validates_presence_of :name, :student_number, :gpa
  # validates_uniqueness_of :name, scope: :school_id
  validates :name, uniqueness: true
  validates :student_number, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000}
  validates :gpa, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 4.0}

  # Associations
  belongs_to :school
end
