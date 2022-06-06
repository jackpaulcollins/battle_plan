class RemovePlanFromCompletion < ActiveRecord::Migration[7.0]
  def change
    remove_reference :completions, :plan
  end
end
