class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :priority
      t.date :due_date
      t.date :start_date
      t.string :assigned_to

      t.timestamps null: false
    end
  end
end
