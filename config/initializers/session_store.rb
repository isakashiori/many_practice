Index::Application.config.session_store :redis_store,
  servers: ["redis://localhost:6379/0/session"],
  expire_after: 90.minutes,
  key: "_index_session",
  threadsafe: true,
  secure: true



# Rails.application.config.session_store :redis_store,
#   servers: %w(redis://localhost:6379/0/session),
#   # ホスト: localhost（docker環境の場合はredisコンテナ名）
#   # ポート: 6379
#   # DB: 0番
#   # ネームスペース: session
#   expire_after: 90.minutes, # 有効期限90分
#   key: "_#{Rails.application.class.parent_name.downcase}_session" # キー名
# このコードだとうまくサーバーが立たない