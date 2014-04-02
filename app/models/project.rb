class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :tasks

  validates :name, presence: true, length: { minimum: 3}, uniqueness: { scope: :user_id}

  scope :sort_by_name, -> {order name: :asc}

end
