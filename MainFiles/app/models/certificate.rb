class Certificate < ApplicationRecord
  belongs_to :student, optional: true
end
