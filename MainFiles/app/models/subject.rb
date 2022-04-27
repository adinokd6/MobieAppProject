class Subject < ApplicationRecord
  has_many :grades
  
  has_and_belongs_to_many :class_types, :join_table => :class_subjects

  belongs_to :teacher, optional: true
  belongs_to :trainer, optional: true
end
