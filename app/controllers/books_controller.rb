class BooksController < ApplicationController

    before_action :authenticate_user!, only: [:index, :create, :edit, :show, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]

    def index
        @user = current_user
        @book = Book.new
        @books = Book.all
    end

    def create 
        @user = current_user
        @books = Book.all
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "Book was successfully created"
            redirect_to book_path(@book.id)
        else
            render "books/index"
        end
        
    end

    def show
        @book = Book.find(params[:id])
        @newbook = Book.new
        @bookinfo = Book.find(params[:id])
        @user = User.find(@bookinfo.user_id)
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(params[:id])
            flash[:notice] = "Book was successfully updated."
        else
            render "books/edit"
        end
        
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

private

def book_params
    params.require(:book).permit(:title, :body)
end
    
def correct_user
    book = Book.find(params[:id])
    redirect_to books_path if current_user.id != book.user_id
end
    
    
end

