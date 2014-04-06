class Ability
  include CanCan::Ability

  def initialize(user)
  	
    can [:read, :create], Project
    can [:update, :destroy], Project do

    end
  end

end
