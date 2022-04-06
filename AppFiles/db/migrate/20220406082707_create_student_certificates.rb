class CreateStudentCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :student_certificates, id: false do |t|
      t.belongs_to :students, index: true
      t.belongs_to :certificate, index: true
    end
  end
end
