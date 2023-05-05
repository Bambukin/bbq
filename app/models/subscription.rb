class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: :user_present?
  validates :user_email, presence: true, email: true, unless: :user_present?

  validates :user_id, uniqueness: {scope: :event_id}, if: :user_present?
  validates :user_email, uniqueness: {scope: :event_id}, unless: :user_present?

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def user_present?
    user.present?
  end
end
