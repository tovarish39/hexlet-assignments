# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def new?
    user
  end

  def create?
    new?
  end

  def edit?
    record.author == user || user&.admin?
  end

  def update?
    edit?
  end

  def destroy?
    user&.admin?
  end
  # END
end
