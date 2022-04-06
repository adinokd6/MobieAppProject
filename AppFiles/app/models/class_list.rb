class ClassList < ApplicationRecord
  has_and_belongs_to_many :class1, :join_table => :students_courses
  has_many :students
end
