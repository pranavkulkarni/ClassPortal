class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :status
      t.references :student
      t.references :course
      t.timestamps null: false
    end
  end
end
