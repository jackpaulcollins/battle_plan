class CreateCompletions < ActiveRecord::Migration[7.0]
  def change
    create_table :completions do |t|
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
