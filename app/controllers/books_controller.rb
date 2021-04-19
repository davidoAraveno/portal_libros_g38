class BooksController < ApplicationController
  def index
    @new_book = BookRequested.new
    @books_available = Book.available
    @user = User.new
    if session[:user]
      @user_active = User.find(session[:user])
    end
      @users = User.all
  end

  def update
    if params[:destroy_reserve]
      @book = Book.find(params[:destroy_reserve])
      @book.update(user_id: nil, reserve: false)
      redirect_to ui_path
    elsif params[:pagar]
      @book = Book.find(params[:pagar])
      @book.update(payed: true, reserve: false)
      redirect_to ui_path
    elsif params[:devolver]
      @book = Book.find(params[:devolver])
      @book.update(payed: false, user_id: nil)
      redirect_to ui_path
    else
      @book = Book.find(params[:id])
      @book.update(reserve: true, user_id: session[:user])
      redirect_to root_path
    end
  end

  def create
    @new_book = BookRequested.new(new_book_params)
    @new_book.user_id = session[:user]
    @new_book.save
    redirect_to root_path, notice: 'LIBRO SOLICITADO!'
  end

  private

  def new_book_params
    params.require(:book_requested).permit(:title, :author, :user_id)
  end
end
