class ChangeCompletion < ActiveRecord::Migration[7.0]
  def change
    remove_column :completions, :task_id
    remove_column :completions, :plan_id
  end
end
