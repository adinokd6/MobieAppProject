class AddClassListsToClassType < ActiveRecord::Migration[7.0]
  def change
    add_reference :class_lists, :class_type
  end
end
