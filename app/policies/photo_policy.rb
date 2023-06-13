class PhotoPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user_is_owner?(record)
  end
end
