class CreateUsersTasks < ActiveRecord::Migration
  def change
    create_table :users_tasks do |t|
      t.belongs_to :user
      t.belongs_to :task

      t.timestamps
    end
  end
end
