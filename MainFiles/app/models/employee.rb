class Employee < ApplicationRecord
  has_one :email
  has_one :teacher
  has_one :trainer
  has_one :class_type
end
