class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[a-z0-9]+@[a-z0-9-]+.[a-z]+/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  attr_accessor :remember_me
  has_many :posts, dependent: :destroy
  has_one :all_mode
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower
  # 上記の意味としては、中間テーブルであるrelationshipsテーブルのidをuserは複数持っているからhas_manyにしている
  # またforeign_keyを明示的に設定している目的としてはfollowing_idというのは擬似的なもので本来なら存在しないidになっているから?
  # foreign_keyを持ってテーブルにアクセスするってことやったら、この上の例から見るとrelationshipsテーブルはuser_idという外部キー
  # を持っていないからrelationshipsテーブルにアクセスできないってことになる
  # だから明示的にfollowing_idっていうrelationshipsテーブルに実在するキーを設定してあげないといけないってことかな
  
  
  has_many :reverce_relationships, class_name: 'Relationships', foreign_key: :follower_id
  has_many :followers, through: :reverce_relationships, source: :following

  delegate :rank, to: :all_mode

  scope :everything, -> {nil}
  # 上記scope内の条件式がfalseの結果だったり、nilになったりするとallメソッドを実行するそう
  scope :everything_n1, -> {everything.includes(:posts)}
  scope :sorted, -> {order(created_at: :desc)}
  scope :recent, -> {everything_n1.sorted}
# 上記のようにscopeを何個かに分ける理由としては、個別に分けた方がそれぞれ個々に使いまわせる頻度が高くなるから

  def is_followed_by?(user)
    reverce_relationships.find_by(following_id: user.id).present?
  end
  

end

# https://qiita.com/sakuro/items/1eaa307609ceaaf51123
# メールアドレスのバリデーションについて上記の表現が正式なものって感じ？
# ^を使うとエラーになるように新しいバージョンではなっているらしいので、\Aを使う方がいい
