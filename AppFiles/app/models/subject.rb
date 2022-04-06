class Subject < ApplicationRecord
  has_and_belongs_to_many :class1, :join_table => :students_courses
end
