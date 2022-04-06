class Class1 < ApplicationRecord
  belongs_to :animal
  has_and_belongs_to_many :subject, :join_table => :students_courses
  has_and_belongs_to_many :classlist, :join_table => :students_courses
  has_many :employers
end
