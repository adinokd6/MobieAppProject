class Email < ApplicationRecord
  belongs_to :employer, optional: true
  belongs_to :student, optional: true
  
  has_many :messages
end
