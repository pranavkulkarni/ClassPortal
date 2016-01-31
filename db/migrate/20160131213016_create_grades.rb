class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :grade
      t.references :student
      t.references :course
      t.timestamps null: false
    end
  end
end
