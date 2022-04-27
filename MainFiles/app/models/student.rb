class Student < ApplicationRecord
  has_many :certificates
  has_many :grades

  belongs_to :class_list

  validates :FirstName, presence: true
  validates :SecondName, presence: true
  validates :StudentId, presence: true, length: { is: 6 }, uniqueness: true
  has_secure_password
end
