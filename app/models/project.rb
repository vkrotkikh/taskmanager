class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :tasks
  validates :name, presence: true
  validates :name, length: { minimum: 3}
  validates :name, uniqueness: { scope: :user_id}

end
