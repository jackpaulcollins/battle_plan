class AddConstraintToCompletion < ActiveRecord::Migration[7.0]
  def change
    add_index :completions, [:completable_id, :completable_type, :completed_on], unique: true, name: "completions_index"
  end
end
