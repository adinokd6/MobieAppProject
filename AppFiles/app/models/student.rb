class Student < ApplicationRecord
  has_and_belongs_to_many :grades, :join_table => :student_grades
  has_and_belongs_to_many :certificates, :join_table => :student_certificates
end
