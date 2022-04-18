class AddFkToCertificates < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :certificates, :students
  end
end
