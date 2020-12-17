class UsersController < ApplicationController
    before_action :current_user
    skip_before_action :redirect_if_not_logged_in, except: [:show, :edit]
    # before_action :redirect_if_not_logged_in, only: [:show, :edit]
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action only: [:show, :edit, :update] do 
        redirect_if_not_authorized_user(@user)
    end
    skip_before_action :protect_from_forgery, raise: false
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
         if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new 
        end
    end

    def show 
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(current_user)
        else 
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end


    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :business_name)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end
end
