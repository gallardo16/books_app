class Users::BooksController < ApplicationController
  DISPLAY_NUMBER = 2

  def index
    @user = User.find(params[:user_id])
    @books = @user.books.page(params[:page]).per(DISPLAY_NUMBER)
  end

  def show
    @user = User.find(params[:user_id])
    @book = @user.books.find(params[:id])
    @comments = @book.comments
  end
end
