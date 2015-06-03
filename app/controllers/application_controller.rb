class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :redirect_root_path
  before_action :auth

  def auth
    if current_user
    else
      redirect_to new_session_url
    end
  end

  def current_user
  	User.find_by(id: session["user_id"])
  end

  def redirect_root_path
    redirect_to root_path, alert: "Nice try buddy"
  end

end
