class EventPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user_is_owner?(record)
  end

  def destroy?
    user_is_owner?(record)
  end

  def show?
    return true if record.pincode.blank?
    return true if user.present? && user == record.user

    if user.params[:pincode].present? && record.pincode_valid?(user.params[:pincode])
      user.cookies.permanent["event_#{record.id}_pincode"] = user.params[:pincode]
    end

    unless record.pincode_valid?(user.cookies.permanent["event_#{record.id}_pincode"])
      return false
    end

    true
  end
end
