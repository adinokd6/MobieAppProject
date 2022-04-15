class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :MessageId
      t.string :From
      t.string :To
      t.text :Text
      t.string :Date

      t.timestamps
    end
  end
end
