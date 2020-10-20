class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_user, :redirect_if_already_signed_in
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = 'Ops! você deve estar logado para realizar tal ação'
      return redirect_to login_path
    end
  end

  def redirect_if_already_signed_in
    return redirect_to root_path if logged_in?
  end
end
