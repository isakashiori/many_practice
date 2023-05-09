#userテーブルにダミーデータを作成する

sex_arr = ['F','M']

5.times do |user|
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    sex: sex_arr.sample
  )
end

#userテーブルのidだけを取得する
users = User.pluck(:id)


#postのダミーデーターを作成して、user_idをランダムで入れてあげて1対多の関係を作成する

titles = ['ロン', 'ツモ', 'テンパイ', 'リーチ', 'マンカン', 'バイマン', 'ハネマン', 'ヤクマン', 'チョンボ', 'メンゼン']
bodies = ['難しいですね', '練習しましょう', 'MJモバイルしましょう', '楽しんでしましょう', '継続しましょう', '雀荘に行く', 'おっちゃんに相手してもらう', '平澤元気チャンネルおすすめ', '頑張ろう', '上手くなる']

10.times do |n|
  Post.create!(
    title: titles[n],
    body: bodies[n],
    user_id: users.sample
  )
end



