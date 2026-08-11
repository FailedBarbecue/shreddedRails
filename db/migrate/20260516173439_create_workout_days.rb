class CreateWorkoutDays < ActiveRecord::Migration[8.1]
  def change
    create_table :workout_days do |t|
      t.string :name

      t.timestamps
    end
  end
end
