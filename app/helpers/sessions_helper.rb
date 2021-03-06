module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if logged_in?
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    session[:user_id] != nil
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def authenticate!
    redirect_to login_path unless logged_in?
  end

  def admin
    true
    #redirect_to root_path #unless current_user.username == 'Penelope'
  end
end
