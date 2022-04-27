class Student < ApplicationRecord
  has_many :certificates
  has_many :grades
  has_one :email

  belongs_to :class_list, optional: true

  validates :FirstName, presence: true
  validates :SecondName, presence: true
  validates :StudentId, presence: true, length: { is: 6 }, uniqueness: true
  has_secure_password
end
