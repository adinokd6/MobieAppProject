class CreateCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :certificates do |t|
      t.integer :CertificateId
      t.string :Name
      t.integer :Grade
      t.text :Description

      t.timestamps
    end
  end
end
