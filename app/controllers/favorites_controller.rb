class FavoritesController < ApplicationController
  def index
  	@favorites = Favorite.all
  end

  def create
  	user = current_user
  	book = Book.find(params[:book_id])
    Favorite.create(user_id: user.id,book_id:book.id)
    redirect_to books_path
  end

  def destroy
  	user=current_user
  	book = Book.find(params[:book_id])
    favorite=Favorite.find_by(user_id: user.id,book_id:book.id)
      favorite.delete
      redirect_to user_favorites_path(current_user)
  end

end
