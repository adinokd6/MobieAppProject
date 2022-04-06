class Certificate < ApplicationRecord
  has_and_belongs_to_many :students, :join_table => :student_certificates
end
