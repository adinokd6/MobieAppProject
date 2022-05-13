class ClassList < ApplicationRecord
  has_many :students, dependent: :nullify
  #dependet nullify delete only parent and set fk in children to null

  belongs_to :class_type, optional: true

  after_create :createClass

  def has_this_student?(student)
    self.students.include?(student)
  end

  def createClass
    @newClass=ClassType.new
    @newClass.ClassId=self.id
    @newClass.class_list=self
    @newClass.save
  end

end
