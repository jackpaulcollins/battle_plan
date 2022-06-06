class MakeCompletetionPolyMorphic < ActiveRecord::Migration[7.0]
  def change
    add_column :completions, :completable_id, :integer
    add_column :completions, :completable_type, :string
  end
end
