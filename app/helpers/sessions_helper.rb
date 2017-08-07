module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    # find raises exception if user_id doesn't exist
    # so use find_by instead
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(user)
    current_user == user
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
  end
end
