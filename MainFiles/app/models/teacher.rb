class Teacher < ApplicationRecord
  has_many :subjects, dependent: :nullify

  belongs_to :employee, optional: true

  after_create :createEmployee

  def has_subject?(subject)
    self.subjects.include?(subject)
  end

  def createEmployee
    @new_employee=Employee.new
    @new_employee.EmployeeId=self.id
    @new_employee.teacher=self
    @new_employee.save
  end
end
