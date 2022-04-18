class AddSubjectsToTrainer < ActiveRecord::Migration[7.0]
  def change
    add_reference :subjects, :trainer
  end
end
