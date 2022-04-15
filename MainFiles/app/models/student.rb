class Student < ApplicationRecord
  has_many :certificates
  has_many :grades
end
