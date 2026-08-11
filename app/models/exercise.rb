class Exercise < ApplicationRecord
  belongs_to :user

  validates :name, :muscle, :equipment, :difficulty, presence: true
  has_many :workout_exercises
  has_many :workout_days, through: :workout_exercises
  has_many :exercise_completions, dependent: :destroy

  def completed_today?
    exercise_completions.exists?(
      completed_on: Date.current
    )
  end
end
