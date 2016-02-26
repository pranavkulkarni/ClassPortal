class CreateEmailNotifications < ActiveRecord::Migration
  def change
    create_table :email_notifications do |t|

      t.references :course
      t.references :student
      t.timestamps null: false
    end
  end
end
