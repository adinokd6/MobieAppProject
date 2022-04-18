class AddFkToClassList < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :class_lists, :class_types
  end
end
