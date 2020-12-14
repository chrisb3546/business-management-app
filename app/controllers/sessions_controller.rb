class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in

    
    
    def home 
    end


    def destroy
        
        session.destroy
        redirect_to root_path 
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            flash[:message] = "invalid credentials, please try again"
            redirect_to login_path
        end
    
    end

    def google
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth.info.email.split("@").first
            user.password = SecureRandom.hex
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to '/'
        end
    end

        private
        def auth
            request.env['omniauth.auth']
        end
    
end