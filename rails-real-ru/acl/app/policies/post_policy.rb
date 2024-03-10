# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # Создавать посты может только залогиненный пользователь
  # Редактировать автор и админ
  # Удалять - админ
  # Смотреть могут все.
  #
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
