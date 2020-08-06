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

    def redirect_if_not_authorized(attr)
        if current_user.id != attr.user_id
            redirect_to user_path(current_user)
        end
    end

    def redirect_if_not_authorized_user(attr)
        if attr.id != current_user.id
            redirect_to user_path(current_user)
        end

    end

    
    def not_found(attr)
        if !attr
        redirect_to user_path(current_user)
        end
    end
     

    def save_jobs
        CompletedJob.all.each do |job|
            job.save

        end
    end


    

end
