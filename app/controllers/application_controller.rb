class ApplicationController < ActionController::Base
  # methods here are available to all controllers
  helper_method :current_user, :logged_in? # marking these methods helper_method makes them available to all views
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end
end
