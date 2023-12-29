# frozen_string_literal: true

#
# Main policy for all policies
#
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  protected

  def owner?
    record.user_id == user.id
  end

  def shipment_owner?
    record.shipment.owner.user_id == user.id
  end

  #
  # Main Scope policy
  #
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope if scope.column_names.exclude?('user_id')

      scope.where(user_id: user.id)
    end

    private

    attr_reader :user, :scope
  end
end
