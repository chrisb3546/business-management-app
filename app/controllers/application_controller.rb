class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
    end

    def redirect_if_not_authorized
        if current_user.id != @user.id
            redirect_to user_path(current_user)
        end
     end

    

end
