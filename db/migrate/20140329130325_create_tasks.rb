class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :status
      t.text :description
      t.datetime :date_closed
      t.integer :priority
      t.string :type
      t.belongs_to :project
      t.belongs_to :user
      t.integer :label
      
      t.timestamps
    end
  end
end
