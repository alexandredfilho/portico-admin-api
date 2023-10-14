# frozen_string_literal: true

#
# This model is responsible to create new instances of Ability
#
class Ability
  include CanCan::Ability

  def initialize(user); end
end
