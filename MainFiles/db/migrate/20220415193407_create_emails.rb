class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.integer :EmailId
      t.string :OwnerId
      t.string :EmailAddress

      t.timestamps
    end
  end
end
