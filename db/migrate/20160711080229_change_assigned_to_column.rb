class ChangeAssignedToColumn < ActiveRecord::Migration
  def change
    remove_column :tasks, :assigned_to 
  end
end
