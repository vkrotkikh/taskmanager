class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :tasks
  accepts_nested_attributes_for :tasks, :users

  validates :name, presence: true, length: { in: 3..50}, uniqueness: { scope: :user_id}

  scope :sort_by_name, -> {order name: :asc}
  
end
