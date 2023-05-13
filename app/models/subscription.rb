class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  before_validation :downcase_user_email

  validates :user_name, presence: true, unless: :user_present?
  validates :user_id, uniqueness: {scope: :event_id}, if: :user_present?
  validates :user_email, presence: true, email: true, uniqueness: {scope: :event_id}, unless: :user_present?
  validate :event_host, if: :user_present?
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

  def event_host
    if user_id == self.event.user.id
      errors.add(:user_id, :invalid)
    end
  end
end
