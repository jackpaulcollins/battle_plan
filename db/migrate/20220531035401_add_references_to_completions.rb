class AddReferencesToCompletions < ActiveRecord::Migration[7.0]
  def change
    add_reference :completions, :plan, index: true
    add_reference :completions, :user, index: true
  end
end
