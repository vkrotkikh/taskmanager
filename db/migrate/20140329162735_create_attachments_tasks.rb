class CreateAttachmentsTasks < ActiveRecord::Migration
  def change
    create_table :attachments_tasks do |t|
      t.integer :attachment_id
      t.integer :task_id
    end
  end
end
