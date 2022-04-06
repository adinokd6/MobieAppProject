class CreateClassListClass < ActiveRecord::Migration[5.2]
  def change
    create_table :class_list_classes, id: false do |t|
      t.belongs_to :classlist, index: true
      t.belongs_to :class1, index: true
    end
  end
end
