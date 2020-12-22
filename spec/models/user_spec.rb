require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
   end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
        it"全ての情報が正しく入力されている" do
          @user.valid?
          expect(@user.errors.full_messages).to include 
        end
     end

    context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        it "passwordが空だと登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Password can't be blank", "Password には英字と数字の両方を含めて設定してください", "Password confirmation doesn't match Password", "Password confirmation doesn't match Password"
        end
        it"passwordが5文字以下の半角英数字混合文字列の場合登録できない" do
          @user.password = "taka0"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password","Password confirmation doesn't match Password","Password is too short (minimum is 6 characters)"
        end
        it"passwordが半角数字のみの場合登録できない" do
          @user.password = "000000"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password","Password confirmation doesn't match Password","Password には英字と数字の両方を含めて設定してください"
        end
        it"passwordが半角英字のみの場合登録できない" do
          @user.password = "aaaaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password","Password confirmation doesn't match Password","Password には英字と数字の両方を含めて設定してください"
        end
        it"passwordが全角英数字の場合登録できない" do
          @user.password = "TAKA００００"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password","Password confirmation doesn't match Password","Password には英字と数字の両方を含めて設定してください"
        end
        it"passwordとpassword（確認用）が一致しない場合登録できない" do
          @user.password_confirmation = "taka1111"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password confirmation doesn't match Password"
        end
        it "emailが空だと登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it "emailに@が含まれていない場合登録できない" do
          @user.email = "testexample"
          @user.valid?
          expect(@user.errors.full_messages).to include "Email is invalid"
        end
        it "emailが登録済みの場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include "Email has already been taken"
        end
        it "last_nameが空だと登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name は全角で入力して下さい。"
        end
        it"last_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
          @user.last_name = "taka"
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name は全角で入力して下さい。"
        end
        it "first_nameが空だと登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank", "First name は全角で入力して下さい。"
        end
        it "last_name_kanaが空だと登録できない" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include  "Last name kana can't be blank", "Last name kana は全角カタカナで入力して下さい。"
        end
        it"last_name_kanaが全角（カタカナ）以外の場合登録できない" do
          @user.last_name_kana = "祖父江"
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name kana は全角カタカナで入力して下さい。"
        end
        it"first_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
          @user.first_name = "taka"
          @user.valid?
          expect(@user.errors.full_messages).to include "First name は全角で入力して下さい。"
        end
        it "first_name_kanaが空だと登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "First name kana can't be blank", "First name kana は全角カタカナで入力して下さい。"
        end
        it"first_name_kanaが全角（カタカナ）以外の場合登録できない" do
          @user.first_name_kana = "祖父江"
          @user.valid?
          expect(@user.errors.full_messages).to include  "First name kana は全角カタカナで入力して下さい。"
        end
        it "birth_dateが空だと登録できない" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Birth date can't be blank"
        end
     end
  end
end