class AddDoneInTask < ActiveRecord::Migration
  def change
    add_column :tasks, :time_spent, :string
    add_column :tasks, :done, :string
  end
end
