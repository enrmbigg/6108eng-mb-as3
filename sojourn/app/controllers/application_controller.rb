class ApplicationController < ActionController::Base

  protect_from_forgery

  private
def active_user
@user ||= User.find(session[:user_id]) if session[:user_id]
end

helper_method :active_user
end
