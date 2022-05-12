class Trainer < ApplicationRecord
  has_many :subjects, dependent: :nullify

  belongs_to :employee

  after_create :createEmployee
  def has_subject?(subject)
    self.subjects.include?(subject)
  end

end
