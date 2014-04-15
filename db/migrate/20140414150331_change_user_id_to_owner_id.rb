class ChangeUserIdToOwnerId < ActiveRecord::Migration
  def change
  	remove_column :projects, :user_id, :integer
  	add_column :projects, :owner_id, :integer
  end
end
