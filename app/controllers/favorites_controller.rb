class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)#boo_idインスタンスにbookのidメソッドを呼び出し代入？
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  #redirect_back　記事https://teratail.com/questions/271225

end
