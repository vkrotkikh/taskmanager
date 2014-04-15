class Ability
  include CanCan::Ability

  def initialize(user)

    can [:update, :destroy, :edit], Project, owner_id: user.id
    
  end

end  
