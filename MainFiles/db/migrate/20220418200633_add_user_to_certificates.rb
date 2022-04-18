class AddUserToCertificates < ActiveRecord::Migration[7.0]
  def change
    add_reference :certificates, :student
  end
end
