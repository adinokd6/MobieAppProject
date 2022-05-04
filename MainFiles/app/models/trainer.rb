class Trainer < ApplicationRecord
  has_many :subjects

  belongs_to :employee
end
