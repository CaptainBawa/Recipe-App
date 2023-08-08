class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Recipe, user: user.id
      can :manage, Food, user: user.id
    end
  end
end
