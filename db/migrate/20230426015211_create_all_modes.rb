class CreateAllModes < ActiveRecord::Migration[6.1]
  def change
    create_table :all_modes do |t|
      t.string :type
      t.integer :rank
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end


# ユーザー一人に対してモードを一つ持っているので1対1の関係で関連付け
# カラムとしてはrankカラムとuser_idを共通で持たせてあげている
# もし個々のモデルでカラムの数だったり、カラム名が違う場合はこちらのマイグレーションファイルでnullをfalseで指定する
