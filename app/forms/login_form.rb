class LoginForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  attribute :sex, :string

  validates :name, :email, presence: true 

  def user_id
    @user = User.find_by(email: email)
    @user.id
  end

  def authenticate
    @user = User.find_by(email: email)
    @user&.email == email
  end
end

# ログインみたいにモデルを使用しない機能を作成する場合はフォームオブジェクトのような
# 擬似的にモデルの役割を持たせてあげることができるのかなって思う
# モデルにはビジネスロジックだけを書かせるイメージでいいのかな？よくわからんけど
# フォームオブジェクトというのactiverecordのモデルとは全く違うものやから、
# 呼び出しできるメソッドも全く違ってくるのは理解できる
# だからformオブジェクトクラス内でメソッドを定義しないといけないってのもわかる
# なぜコントローラーじゃなくてフォームオブジェクト内なのかというとファットコントローラーになるし
# ビジネスロジックはコントローラーに書くべきではないってことになるからやけど
# フォームオブジェクトではparamsを使わなくてもフォームから値を取得してくることができる

