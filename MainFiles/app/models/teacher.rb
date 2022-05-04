class Teacher < ApplicationRecord
  has_many :subjects

  belongs_to :employee

  def has_subject?(subject)
    self.subjects.include?(subject)
  end
end
