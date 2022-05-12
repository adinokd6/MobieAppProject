class ClassList < ApplicationRecord
  has_many :students, dependent: :nullify
  #dependet nullify delete only parent and set fk in children to null

  belongs_to :class_type, optional: true

  def has_this_student?(student)
    self.students.include?(student)
  end
end
