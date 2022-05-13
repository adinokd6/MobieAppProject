class CreateClassSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :classes_subjects, id: false do |t|
      t.belongs_to :class_type, index: true
      t.belongs_to :subject, index: true
    end
  end
end
