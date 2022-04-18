class AddMessagesToEmail < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :email
  end
end
