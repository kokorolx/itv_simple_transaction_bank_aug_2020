# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Account do |account|
      user.id == account.user_id
    end
  end
end
