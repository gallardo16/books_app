class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  include Commentable
end
