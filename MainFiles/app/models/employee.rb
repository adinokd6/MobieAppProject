class Employee < ApplicationRecord
  has_one :email
  has_one :teacher
  has_one :trainer
  belongs_to :class_type, optional: true
end
