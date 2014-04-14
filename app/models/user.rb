class User < ActiveRecord::Base

  has_many :projects_users
  has_many :projects, foreign_key: 'owner_id', class_name: Project
  has_many :tasks
  
  accepts_nested_attributes_for :projects_users

	validates :name, presence: true, length: { in: 3..50}, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
end
