# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # admin
    if user.has_role? :admin
      can :manage, :all # ex) create, edit
    else
      can [:index, :show, :create, :new], Post
      can [:edit, :update, :destroy], Post, user_id: user.id
      can :destroy, Comment, user_id: user.id
    end
  end
end