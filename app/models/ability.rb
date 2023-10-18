# frozen_string_literal: true

#
# This model is responsible to create new instances of Ability
#
class Ability
  include CanCan::Ability

  def initialize(user)
    send("#{user.role}_abilities", user)
  end

  def admin_abilities(_user)
    can :manage, :all
  end

  def gate_agent_abilities(_user)
    can %i[create read update destroy], Driver
    can %i[create read update destroy], Vehicle
    can %i[read], Customer
    can :manage, Shipment
  end

  def dock_agent_abilities(_user)
    can %i[update], Shipment
  end

  def user_abilities(_user)
    can :read, :all
  end
end
