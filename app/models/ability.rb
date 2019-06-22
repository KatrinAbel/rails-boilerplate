# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, [Product, User]
    else
      can [:read, :create], Product
      can [:update, :destroy], Product, user_id: user.id
    end
  end
    
end
