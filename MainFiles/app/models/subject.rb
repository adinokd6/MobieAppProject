class Subject < ApplicationRecord
  has_many :grades
  has_many :classes

  belongs_to :teacher, optional: true
  belongs_to :trainer, optional: true
end
