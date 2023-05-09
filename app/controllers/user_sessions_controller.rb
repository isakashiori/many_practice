class UserSessionsController < ApplicationController
  protect_from_forgery
  def new
    @user = LoginForm.new
  end

  def create
    @user = LoginForm.new(form_params)
    if @user.valid? && @user.authenticate #ここで@userがnilになってはいけないのでぼっち演算子でエラーを防ぐ
      session[:user_id] = @user.user_id #loginformオブジェクトはidを持たないので、loginformクラスでuserメソッドを定義してユーザーidを取得するようにしてくる
      # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
    else
      render :new
    end
  end
  # 上記でやりたいこととしては、ログインフォームで作成したメアドと名前をユーザー登録したモデルに保存されている情報と合っているのか
  # 確認するために、認証させてあげないといけない
  # formクラスでもインスタンスメソッドが定義されているということは、こちらもインスタンスを作成しないとインスタンス変数を呼び出すことができない

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private
  def form_params
    params.require(:login_form).permit(:email, :name)
  end
end

# 何でログインの時はnewアクションの処理内容を書かないんやろう
# 新規登録の時は、newアクションにてインスタンスを作成することによって、form_withで空のインスタンスか
# によってアクションの振り分けを行うからなのか
# ログイン機能は別にデータベースに登録する必要もないから、インスタンスを作る必要がないからnewアクションに
# 処理を書かないっていう理解でいけるかな?

