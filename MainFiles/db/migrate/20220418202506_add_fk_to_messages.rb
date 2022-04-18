class AddFkToMessages < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :messages, :emails
  end
end
