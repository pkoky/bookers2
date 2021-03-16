class UsersController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name)
  end


end
