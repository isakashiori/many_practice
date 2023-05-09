module UserSessionsHelper
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cockies.permanent[:remember_token] = user.remember_token
  end
end