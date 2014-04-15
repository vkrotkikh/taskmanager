class Ability
  include CanCan::Ability

  def initialize(user)
  	
    can [:create], Project
    can [:read ], Project, Project.joins(:users).where(users: { id: user.id })
    can [:update, :destroy], Project, owner_id: user.id
  end

end
