class SubscriptionPolicy < ApplicationPolicy
  def destroy?
    user_is_owner?(record)
  end
end
