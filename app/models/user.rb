class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :postalcode, length: { is: 7 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]


  has_many :books, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :comments, as: :commentable
  has_one_attached :avatar

  def self.find_for_github_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      # 任意の20文字の文字列を作成する
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.create_unique_string
    SecureRandom.uuid
  end
end
