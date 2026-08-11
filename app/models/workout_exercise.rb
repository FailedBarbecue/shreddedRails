class WorkoutExercise < ApplicationRecord
  belongs_to :workout_day
  belongs_to :exercise
end
