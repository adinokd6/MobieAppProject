class Grade < ApplicationRecord
  class Student < ApplicationRecord
    has_and_belongs_to_many :students, :join_table => :student_grades
  end

end