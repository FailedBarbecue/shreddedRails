class ExercisesController < ApplicationController
  before_action :require_login

  def new
    @exercise = Exercise.new
    @workout_days = WorkoutDay.all
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)

    if @exercise.save
      workout_day_ids = params[:exercise][:workout_day_ids]

      if workout_day_ids.present?
        @exercise.workout_day_ids = workout_day_ids.reject(&:blank?)
      end

      redirect_to root_path
    else
      @workout_days = WorkoutDay.all
      render :new, status: :unprocessable_entity
    end
  end

  def toggle_completion
    @exercise = current_user.exercises.find(params[:id])

    completion = @exercise.exercise_completions.find_by(
      completed_on: Date.current
    )

    if completion
      completion.destroy
    else
      @exercise.exercise_completions.create!(
        completed_on: Date.current
      )
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(
      :name,
      :muscle,
      :equipment,
      :difficulty
    )
  end
end
