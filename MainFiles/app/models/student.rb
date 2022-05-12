class Student < ApplicationRecord
  has_many :certificates
  has_many :grades
  has_one :email

  belongs_to :class_list, optional: true

  validates :FirstName, presence: true
  validates :SecondName, presence: true
  validates :StudentId, presence: true, length: { is: 6 }, uniqueness: true

  has_secure_password
  has_secure_token

  after_create :createEmail
  def invalidate_token
    self.update_columns(token: nil)
  end

  def createEmail
    @new_email=Email.new
    @new_email.EmailId=self.StudentId
    @new_email.EmailAddress="student."+self.StudentId.to_s+"@schoolemail.com"
    self.email=@new_email
    self.EmailId=self.email.id
  end
end
