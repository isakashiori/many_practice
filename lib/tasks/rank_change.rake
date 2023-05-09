namespace :rank_change do
  desc 'ランクが5になったら階級を変更してあげる'
  task rank_up: :environment do
    puts "馬鹿野郎"
    # user_class = AllMode.find(current_user.id)
    # if current_user.rank == 5 && user_class.type == "Beginner"
    #   # 現在のユーザーのランクが5でかつ現在のユーザーのクラスが初級・中級なのか条件式で確認している
    #   user_class.destroy!
    #   Intermediate.create(rank: 1, user_id: current_user.id)
    # elsif current_user == 5 && user_class.type == "Intermediate"
    #   user_class.destroy!
    #   Advanced.create(rank: 1, user_id: current_user.id)
    # end
  end
end

# ランクも階級もデフォルトだと0の状態に初期設定ではしておく
# 条件としては初級5、中級5のパターンの二つ
# 一旦条件に当てはまる時には該当のモデルからデータを削除してあげないといけない
# 全モードモデルの方だけ該当するデータを削除するけど、userモデルは削除してはいけないから
# dependent::destroyはつけていない
