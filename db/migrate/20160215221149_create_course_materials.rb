class CreateCourseMaterials < ActiveRecord::Migration
  def change
    create_table :course_materials do |t|
      t.string :title
      t.string :message
      t.references :course
      t.references :instructor

      t.timestamps null: false
    end
  end
end
