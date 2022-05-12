class Employee < ApplicationRecord
  has_one :email, dependent: :nullify
  has_one :teacher, dependent: :nullify
  has_one :trainer, dependent: :nullify
  belongs_to :class_type, optional: true

  after_create :createEmail

  def createEmail
    @new_email=Email.new
    @new_email.EmailId=self.id
    @new_email.EmailAddress="employee."+self.id.to_s+"@schoolemail.com"
    self.email=@new_email
    self.EmailId=self.email.id
  end
end
