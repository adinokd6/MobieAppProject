class ClassType < ApplicationRecord
  has_and_belongs_to_many :animals, dependent: :nullify, :join_table => :animal_classes
  has_and_belongs_to_many :subjects, :join_table => :class_subjects

  has_one :employee, dependent: :nullify

  has_one :class_list, dependent: :nullify
  has_one :class_room, dependent: :nullify
  has_many :subjects, dependent: :nullify

  def has_subject?(subject)
    self.subjects.include?(subject)
  end

  def has_animal?(animal)
    self.animals.include?(animal)
  end

  def istutor?(employee)
    self.employee.include?(employee)
  end
end
