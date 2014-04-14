class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
	validates :name, presence: true, length: { in: 3..50}

	has_many :attachments
end
