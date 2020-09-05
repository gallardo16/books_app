class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :postalcode, length: { is: 7 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]


  has_many :books, dependent: :destroy
  has_one_attached :avatar

  has_many :active_friendships, foreign_key: "following_id", class_name: "Friendship", dependent: :destroy
  has_many :followings, through: :active_friendships, source: :followed
  has_many :passive_friendships, foreign_key: "followed_id", class_name: "Friendship", dependent: :destroy
  has_many :followers, through: :passive_friendships, source: :following

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

  def follow(other_user)
    active_friendships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_friendships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end
