class CreateClassLists < ActiveRecord::Migration[5.2]
  def change
    create_table :class_lists do |t|
      t.integer :ClassListId

      t.timestamps
    end
  end
end
