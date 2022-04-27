class Employee < ApplicationRecord
  has_one :email, optional: true
  has_one :teacher, optional: true
  has_one :trainer, optional: true

  has_many :class_types
end
