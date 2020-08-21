class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  DISPLAY_NUMBER = 2
  def index
    @books = Book.page(params[:page]).per(DISPLAY_NUMBER)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

      if @book.save
        redirect_to @book, notice: t('view.book.flash.create')
      else
        render :new
      end
  end

  def update
      if @book.update(book_params)
        redirect_to @book, notice: t('view.book.flash.update')
      else
        render :edit
      end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: t('view.book.flash.destroy')
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end
