class AddUserIdToExercises < ActiveRecord::Migration[8.1]
  def up
    add_reference :exercises, :user, foreign_key: true

    default_user = User.order(:created_at).first
    if default_user.nil?
      default_user = User.create!(name: "Default User", email: "default@example.com", password: "password123", password_confirmation: "password123")
    end

    Exercise.where(user_id: nil).update_all(user_id: default_user.id)
    change_column_null :exercises, :user_id, false
  end

  def down
    remove_reference :exercises, :user
  end
end
