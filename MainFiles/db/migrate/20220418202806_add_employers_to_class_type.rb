class AddEmployersToClassType < ActiveRecord::Migration[7.0]
  def change
    add_reference :employers, :class_type
  end
end
