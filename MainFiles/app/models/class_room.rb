class ClassRoom < ApplicationRecord
  belongs_to :classType, optional: true
end
