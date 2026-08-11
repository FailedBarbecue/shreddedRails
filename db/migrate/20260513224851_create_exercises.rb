class CreateExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle
      t.string :equipment
      t.string :video_url
      t.string :difficulty



      t.timestamps
    end
  end
end
