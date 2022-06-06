class AddCompletedStateAtToCompletions < ActiveRecord::Migration[7.0]
  def change
    add_column :completions, :created_state_at, :datetime
  end
end
