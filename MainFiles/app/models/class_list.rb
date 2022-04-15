class ClassList < ApplicationRecord
  has_many :students
  belongs_to :classType, optional: true
end
