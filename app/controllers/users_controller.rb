class UsersController < ApplicationController
  protect_from_forgery
  before_action :set_user, only: %w[ show edit update destroy ]
  before_action :require_login, only: %w[ index ]

  def index
    @users = User.recent #userモデルにてscopeでメソッドを定義
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(params_user)
      redirect_to @user
    else
      render :edit
    end
  end
# 上記でredirect_toの後ろに@userとインスタンス変数が渡されている理由について
# ルーティングにresourcesで設定しているのであれば可能
# @userの中身としては変更されたユーザーのidを戻り値としてレシーバである@userに戻ってくる
# またredirect_toはアクションを実行してからviewを反映する仕組みとなっている
# ということはgetリクエストのidが入っているものといえばshowアクションということで上記のようなことが実現することができる

  def destroy
    @user.destroy!
    redirect_to users_path
  end

  # リメンバーミー設定

  # def self.new_token
  #   SecureRandom.urlsafe_base64
  # end

  # def self.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                 BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end

  # def remember
  #   self.remember_token = User.new_token
  #   update_attribute(:remember_digest, User.digest(remember_token))
  # end

  # def authenticated?(remember_token)
  #   BCrypt::Password.new(remember_digest).is_password?(remember_token)
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:name, :email, :sex)
  end
end
