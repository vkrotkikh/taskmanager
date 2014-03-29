class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :status
      t.text :description
      t.datetime :date_closed
      t.integer :priority
      t.integer :project_id
      t.integer :user_id
      t.integer :label
      
      t.timestamps
    end
  end
end
