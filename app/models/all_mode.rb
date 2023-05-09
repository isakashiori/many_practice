class AllMode < ApplicationRecord
  belongs_to :user
  #validates :user_id, uniqueness: {scope: :type}

end
# Allmodeクラスを一つのテーブルとしてみなして欲しい
# そして1ユーザーに対して、1モードに紐づいて欲しいのに
# 同じユーザーで違うモデルからデータを作成してしまうと同じユーザーidが入ってしまう
# モデル側で処理を書いてあげないといけないって感じになるのか


