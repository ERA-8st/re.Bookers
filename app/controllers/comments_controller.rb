class CommentsController < ApplicationController

    def create
        book = Book.find(params[:book_id])
        @book = Book.find(params[:book_id])
        @newbook = Book.new
        @user = User.find(book.user_id)
        @comment = Comment.new
        book = Book.find(params[:book_id])
        comment =current_user.comments.new(comment_params)
        comment.book_id = book.id
        if comment.save
            redirect_to book_path(book)
        else
            flash[:comment] = "commented error"
            redirect_to book_path(book)
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_back(fallback_location: root_path)
    end

    private

    def comment_params
        params.require(:comment).permit(:comment)
    end
    
    
    
end
