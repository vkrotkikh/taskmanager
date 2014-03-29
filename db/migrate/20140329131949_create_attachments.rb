class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
    	t.belongs_to :task
    	t.string :attach_link

      t.timestamps
    end
  end
end
