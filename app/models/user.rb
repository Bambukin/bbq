class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[github vkontakte]
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [200, 200]
  end

  validates :avatar, blob: { content_type: %w[image/png image/jpg image/jpeg] }
  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create
  before_validation :downcase_email

  after_commit :link_subscriptions, on: :create

  def self.find_for_oauth(access_token, provider)
    data = access_token.info
    user = User.find_or_initialize_by(email: data['email'].downcase)

    if user.persisted?
      user.confirm
      return user
    end

    oauth_avatar = if provider == 'Vkontakte'
                     access_token.extra.raw_info['photo_200_orig']
                   else
                     data['image']
                   end

    user.assign_attributes(
      name: data['name'],
      email: data['email'],
      password: Devise.friendly_token[0, 20],
      oauth_avatar:
    )
    user.skip_confirmation!
    user.save

    user
  end

  private

  def set_name
    self.name = "#{I18n.t('controllers.user.friend')} #{rand(777)}" if self.name.blank?
  end

  def downcase_email
    email&.downcase!
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
