require File.expand_path(File.dirname(__FILE__) + "/environment")
# File.expand_pathは相対パスを絶対パスに変換する
# (__FILE__)は現在実行しているファイル名を指している
# File.dirname(__FILE__)は現在実行しているファイルのディレクトリパスを返す
# なのでこの場合だと、app/configになる、プラス/environmentがついているので結果的にはapp/config/environmentというパスになる


rails_env = ENV['RAILS_ENV'] || :development
# ||の使い方としては左辺が偽の場合に関して、右側の処理がrails_envの中に格納されるイメージ

set :environment, rails_env

set :output, "#{Rails.root}/log/cron.log"

every 1.minutes do
  rake 'rank_change:rank_up'
end


