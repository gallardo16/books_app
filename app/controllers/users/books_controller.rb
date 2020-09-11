class Users::BooksController < ApplicationController
  DISPLAY_NUMBER = 2

  def index
    @user = User.find(params[:user_id])
    @books = @user.books.page(params[:page]).per(DISPLAY_NUMBER)
  end
end
