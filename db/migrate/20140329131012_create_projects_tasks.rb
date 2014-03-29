class CreateProjectsTasks < ActiveRecord::Migration
  def change
    create_table :projects_tasks do |t|
			t.belongs_to :project
      t.belongs_to :task

      t.timestamps
    end
  end
end
