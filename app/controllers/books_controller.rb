class BooksController < ApplicationController

    def index
        #@books = Book.all
        @books = Book.search(params[:search]) #検索機能
        @book = Book.new
        @user = current_user
    end

	def new
		@book = Book.new
    end

    def users
        @users = User.all
    end

    def books
    end


    def create
        @books = Book.all
    	@book = Book.new(book_params)
        @user = current_user
        @book.user_id = current_user.id
    	if @book.save
        flash[:success] = "Book is successfully!!!!"
    	redirect_to book_path(@book.id)
        else
        render :index
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def show
    	@book = Book.find(params[:id])
        @book_new = Book.new
        @post_comment = PostComment.new  #コメント機能
        @favorite = Favorite.new #お気に入り
        @user = current_user
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:update] = "Book was successfully update(^o^)/~~"
            redirect_to book_path(@book.id)
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

 private
    def book_params
        params.require(:book).permit(:title, :opinion)
    end
end