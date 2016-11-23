class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, User
      can [:read, :create], Comment
    else
      can :read, User do |u|
        u == user
      end
      can [:read, :create], Comment
    end
  end
end
