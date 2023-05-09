class RelationshipsController < ApplicationController
  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to requet.referrer || root_path
  end

  def destroy
    following = current_user.relationships.find(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || root_path
  end
end

# マイグレーションファイルにはfollowing,followerカラムを設定しているから上記のような記述になる
# createもdestroyもフォロワーを中間テーブルに保存したり削除したりするものになる
