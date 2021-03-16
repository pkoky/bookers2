class UsersController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def show
  end

end 
