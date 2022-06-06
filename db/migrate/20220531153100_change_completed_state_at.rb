class ChangeCompletedStateAt < ActiveRecord::Migration[7.0]
  def change
    rename_column :completions, :created_state_at, :completed_on
  end
end
