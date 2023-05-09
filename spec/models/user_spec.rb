require 'rails_helper'

Rspec.describe User, type: :model do
  describe '#create' do
    let!(:user) { User.new(**params) }
    let(:params) {{ name: 'test', email: email }}
    subject {}
    context 'emailが正常な値の時' do
      let(:email) { 'test@example.com' }
      it 'データが正常に保存されるのを取得して確認できる' do
        expect(user).to be_valid
      end
    
    context 'emailがnilの値の時' do
      let(:email) { nil }
      it 'バリデーションで引っかかる' do
        expect()
      end

    context 'emailが異常な値の時' do
      let(:email) { 'eregnksb' } do
      it 'バリデーションで引っかかる' do
        expect()
      end
    end
end

