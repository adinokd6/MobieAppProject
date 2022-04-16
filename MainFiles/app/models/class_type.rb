class ClassType < ApplicationRecord
  has_and_belongs_to_many :animals, :join_table => :animal_classes
  has_many :class_lists
  has_many :class_rooms
end
