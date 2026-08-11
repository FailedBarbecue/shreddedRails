class CreateExerciseCompletions < ActiveRecord::Migration[8.1]
  def change
    create_table :exercise_completions do |t|
      t.references :exercise, null: false, foreign_key: true
      t.date :completed_on

      t.timestamps
    end
  end
end
