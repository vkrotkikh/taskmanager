class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:create], Project
    can [:read], Project do |project|
      project.projects_users.pluck(:user_id).include?(user.id)
    end
    can [:read, :update, :destroy], Project, owner_id: user.id
    can [:create], Task
    can [:read, :update, :destroy], Task do |task|
    	#binding.pry   
      user.projects_users.pluck(:project_id).include?(task.project_id) ||
      user.own_projects.pluck(:id).include?(task.project_id)
    end

  end

end  
