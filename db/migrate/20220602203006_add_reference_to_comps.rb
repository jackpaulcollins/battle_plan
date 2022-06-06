class AddReferenceToComps < ActiveRecord::Migration[7.0]
  def change
    add_reference :completions, :plan
  end
end
