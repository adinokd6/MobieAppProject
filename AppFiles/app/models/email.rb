class Email < ApplicationRecord
  belongs_to :employer
  belongs_to :student
end
