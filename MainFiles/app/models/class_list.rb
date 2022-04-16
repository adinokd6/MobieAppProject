class ClassList < ApplicationRecord
  has_many :students
  belongs_to :class_type, optional: true
end
