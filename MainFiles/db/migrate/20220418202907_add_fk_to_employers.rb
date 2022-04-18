class AddFkToEmployers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :employers, :class_types
  end
end
