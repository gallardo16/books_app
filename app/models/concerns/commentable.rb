module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :conmments, as: :commentable
  end
end
