require "test_helper"

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  test "user only sees their own exercises" do
    alice = User.create!(name: "Alice", email: "alice2@example.com", password: "password123", password_confirmation: "password123")
    bob = User.create!(name: "Bob", email: "bob2@example.com", password: "password123", password_confirmation: "password123")

    alice_exercise = alice.exercises.create!(name: "Squat", muscle: "Legs", equipment: "Barbell", video_url: "https://example.com/squat", difficulty: "Intermediate")
    bob_exercise = bob.exercises.create!(name: "Push Up", muscle: "Chest", equipment: "Bodyweight", video_url: "https://example.com/push-up", difficulty: "Beginner")

    post login_path, params: { session: { email: alice.email, password: "password123" } }
    follow_redirect!

    get root_path
    assert_response :success
    assert_includes response.body, alice_exercise.name
    assert_not_includes response.body, bob_exercise.name
  end

  test "user can create exercise and see it on the home page" do
    user = User.create!(name: "Carol", email: "carol@example.com", password: "password123", password_confirmation: "password123")

    post login_path, params: { session: { email: user.email, password: "password123" } }
    follow_redirect!

    post exercises_path, params: {
      exercise: {
        name: "Deadlift",
        muscle: "Back",
        equipment: "Barbell",
        video_url: "https://example.com/deadlift",
        difficulty: "Advanced",
        workout_day_ids: [WorkoutDay.first.id]
      }
    }

    follow_redirect!

    assert_includes response.body, "Deadlift"
  end
end
