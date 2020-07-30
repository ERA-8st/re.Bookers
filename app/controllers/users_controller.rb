class UsersController < ApplicationController

    before_action :authenticate_user!, only: [:show, :users, :users, :update, :edit]
	before_action :correct_user, only: [:edit, :update]

    def show
        @book = Book.new
        @user = User.find(params[:id])
        @books = @user.books

    end

    def users
        @user = current_user
        @users = User.all
        @book = Book.new
    end

    def edit
        @user =User.find(params[:id])
    end

    def update
        @user =  User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "successfully updated."
            redirect_to user_path(@user.id)
        else
            render action: :edit
        end
        
    end
    
    private

    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
    
    def correct_user
		user = User.find(params[:id])
		redirect_to user_path(current_user.id) if current_user.id != user.id
	end
    
end
