# frozen_string_literal: true

# comment
class UserPolicy < ApplicationPolicy
  def show?
    user
  end
end
