class Trainer < ApplicationRecord
  has_many :subjects
  belongs_to :employer, optional: true
end
