class Grade < ApplicationRecord
  belongs_to :student, optional: true
end
