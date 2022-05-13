class Animal < ApplicationRecord
  has_and_belongs_to_many :class_types, :join_table => :animals_classes
end
