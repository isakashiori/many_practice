class ApplicationController < ActionController::Base

  def current_user
    if session[:user_id]
      current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def require_login
    if session[:user_id]
      p "ログイン済みです"
    else
      p "ログインしていません"
      redirect_to login_path
    end
  end
end

# current_userメソッドについて
# user_sessionsにてcreateアクションを実行後に、login処理が行われると
# session[:user_id]にログイン成功したuserのid情報が格納される
