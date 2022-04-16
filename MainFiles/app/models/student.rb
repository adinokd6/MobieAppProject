class Student < ApplicationRecord
  has_many :certificates
  has_many :grades
  validates :FirstName, presence: true, uniqueness: true
  validates :SecondName, presence: true, uniqueness: true
  has_secure_password
end
