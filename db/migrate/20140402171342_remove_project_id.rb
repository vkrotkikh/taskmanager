class RemoveProjectId < ActiveRecord::Migration
  def change
  	remove_column :users, :project_id
  	drop_table :projects_users
  end
end
