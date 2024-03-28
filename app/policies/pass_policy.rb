class PassPolicy < ApplicationPolicy
  def edit?
    user&.admin? || user&.guard?
  end

  def change_status?
    user&.admin? || user&.guard?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
