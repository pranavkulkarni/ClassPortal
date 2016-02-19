class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.references :course
      t.references :instructor
      t.references :student

      t.timestamps null: false
    end
  end
end
