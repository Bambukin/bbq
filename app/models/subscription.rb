class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  before_validation :downcase_user_email

  validates :user_name, presence: true, unless: :user_present?
  validates :user_id, uniqueness: {scope: :event_id}, if: :user_present?
  validates :user_email, presence: true, email: true, uniqueness: {scope: :event_id}, unless: :user_present?
  validate :owner_email, if: :user_present?
  validate :email_is_free, unless: :user_present?

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

  private

  def user_present?
    user.present?
  end

  def downcase_user_email
    user_email&.downcase!
  end

  def email_is_free
    if User.exists?(email: user_email)
      errors.add(:user_email, :taken)
    end
  end

  def owner_email
    if user_email == User.joins(:events).find_by(events: { id: event_id }).email
      errors.add(:user_id, :invalid)
    end
  end
end
