class Subject < ApplicationRecord
  has_many :grades
  belongs_to :teacher, optional: true
  belongs_to :trainer, optional: true
  swagger_controller :subjects, 'Subjects'
end
