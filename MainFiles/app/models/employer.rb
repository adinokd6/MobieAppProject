class Employer < ApplicationRecord
  belongs_to :email, optional: true
  belongs_to :classType, optional: true
end
