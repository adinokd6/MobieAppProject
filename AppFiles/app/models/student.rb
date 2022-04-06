class Student < ApplicationRecord
  has_and_belongs_to_many :grades, :join_table => :students_courses
end
