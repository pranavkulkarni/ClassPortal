class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :courseNumber
      t.string :title
      t.string :description
      #t.string :instructor
      t.date :startDate
      t.date :endDate
      t.string :status
      t.references :instructor
      t.timestamps null: false
    end
  end
end

