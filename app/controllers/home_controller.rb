class HomeController < ApplicationController
  before_action :require_login

  def index
    weekdays = [
      "Segunda",
      "Terça",
      "Quarta",
      "Quinta",
      "Sexta",
      "Sábado",
      "Domingo"
    ]

    weekday_map = {
      "Monday" => "Segunda",
      "Tuesday" => "Terça",
      "Wednesday" => "Quarta",
      "Thursday" => "Quinta",
      "Friday" => "Sexta",
      "Saturday" => "Sábado",
      "Sunday" => "Domingo"
    }

    @today_name = weekday_map[Date.today.strftime("%A")]

    selected_day = params[:day] || @today_name

    current_index = weekdays.index(selected_day)

    @previous_day = weekdays[(current_index - 1) % weekdays.length]
    @next_day = weekdays[(current_index + 1) % weekdays.length]

    @workout_day = WorkoutDay.find_by(name: selected_day)

    @exercises = current_user.exercises.includes(:workout_days)

    if @workout_day
      @exercises = @exercises.joins(:workout_days).where(workout_days: { id: @workout_day.id })
    end

    @exercises = @exercises.order(:created_at)
  end
end