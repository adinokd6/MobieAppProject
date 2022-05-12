class Teacher < ApplicationRecord
  has_many :subjects, dependent: :nullify

  belongs_to :employee

  after_create :createEmployee

  def has_subject?(subject)
    self.subjects.include?(subject)
  end

  def createEmail
    @new_employee=Employee.new
    @new_employee.EmployeeId=self.id
    @new_employee.Teacher=self
  end
end
