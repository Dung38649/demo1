class ApplicationController < ActionController::Base
    include Pundit
    include ApplicationHelper
    protect_from_forgery
    
end
