class Trainer < ApplicationRecord
  has_many :subjects, dependent: :nullify

  belongs_to :employee, optional: true

  after_create :createEmployee
  validates :TrainerId, presence: true, length: { is: 3 }, uniqueness: true

  has_secure_password
  has_secure_token

  def has_subject?(subject)
    self.subjects.include?(subject)
  end
  def invalidate_token
    self.update_columns(token: nil)
  end

  def createEmployee
    @new_employee=Employee.new
    @new_employee.EmployeeId=self.id
    @new_employee.trainer=self
    @new_employee.save
  end

end
