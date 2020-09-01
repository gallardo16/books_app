class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :postalcode, length: { is: 7 }

  has_many :books, dependent: :destroy
  has_one_attached :avatar
end
