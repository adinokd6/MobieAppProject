class ClassType < ApplicationRecord
  has_and_belongs_to_many :animals, :join_table => :animal_classes
  has_and_belongs_to_many :subjects, :join_table => :class_subjects

  has_one :employee

  has_one :class_list
  has_one :class_room
  has_many :subjects

  def follows?(subject)
    self.subjects.include?(subject)
  end

  def istutor?(employee)
    self.employee.include?(employee)
  end
end
