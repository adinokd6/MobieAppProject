class AddFkMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :email, index: true
    add_foreign_key :messages, :emails
  end
end
