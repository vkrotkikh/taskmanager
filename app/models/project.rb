class Project < ActiveRecord::Base

  has_many :projects_users
  has_many :users, through: :projects_users
  has_many :tasks

  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :projects_users

  validates :name, presence: true, length: { in: 3..50}, uniqueness: { scope: :owner_id}

  scope :sort_by_name, -> {order name: :asc}
  
end
