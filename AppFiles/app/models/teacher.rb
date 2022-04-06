class Teacher < ApplicationRecord
  belongs_to:employer
  has_many :subjects
end
