class CreateCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :certificates do |t|
      t.string :CertificateId
      t.string :Name
      t.string :Grade
      t.text :Description

      t.timestamps
    end
  end
end
