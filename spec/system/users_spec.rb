require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'ユーザー新規登録関係' do
    context '成功系' do
      it 'ユーザーの新規登録が成功すること' do
        visit new_user_path
        fill_in '名前', with: 'テストユーザー'
        fill_in 'メールアドレス', with: 'testuser@example.com'
        select 'F', from: '性別'
        click_button '登録'
        
        expect(page).to have_content('ログインについて')
      end
    end

    context '失敗系' do
      it 'メールアドレスが未入力の場合に登録ができない' do
        visit new_user_path
        fill_in '名前', with: 'テストユーザー'
        fill_in 'メールアドレス', with: ''
        select 'F', from: '性別'
        click_button '登録'

        expect(page).to have_content('メールアドレスを入力してください')
      end
    end
  end
end