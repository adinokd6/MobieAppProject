class CreateSubjectClass < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_classes, id: false do |t|
      t.belongs_to:subject, index: true
      t.belongs_to:class1, index: true
    end
  end
end
