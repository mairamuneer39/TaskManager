class Change < ActiveRecord::Migration
  def change
    rename_column :tasks, :user_id, :assigned_to_id
  end
end
