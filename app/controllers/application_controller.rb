class ApplicationController < ActionController::Base
    include Pundit
    include ApplicationHelper
    protect_from_forgery
    helper_method :current_user

    private
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end
end
