class HomeController < ApplicationController
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

    @exercises = @workout_day&.exercises || []
  end
end