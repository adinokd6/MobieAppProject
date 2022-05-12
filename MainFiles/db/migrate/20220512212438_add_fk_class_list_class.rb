class AddFkClassListClass < ActiveRecord::Migration[7.0]
  def change
    add_reference :class_lists, :class_type, index: true
    add_foreign_key :class_lists, :class_types
  end
end
