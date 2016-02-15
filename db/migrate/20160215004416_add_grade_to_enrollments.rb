class AddGradeToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :grade, :string
  end
end
