require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user =FactoryBot.create(:user)
    @item =FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
    sleep 1

   end

   describe '商品登録' do
    context '購入履歴の保存がうまくいくとき' do
        it"全ての情報が正しく入力されている" do
          expect(@order).to be_valid
        end
        it"建物以外の情報が正しく入力されている" do
          @order.building_name = ""
          expect(@order).to be_valid
        end
     end
    
    context '購入履歴の保存がうまくいかないとき' do
        it "zip_codeが空だと登録できない" do
          @order.zip_code = ""
          @order.valid?
          expect(@order.errors.full_messages).to include "Zip code can't be blank", "Zip code Zip code input correctly"
        end
        it "area_idが空だと登録できない" do
          @order.area_id = ""
          @order.valid?
          expect(@order.errors.full_messages).to include "Area can't be blank"
        end
        it "cityが空だと登録できない" do
          @order.city = ""
          @order.valid?
          expect(@order.errors.full_messages).to include "City can't be blank"
        end
        it "street_numberが空だと登録できない" do
          @order.street_number = ""
          @order.valid?
          expect(@order.errors.full_messages).to include "Street number can't be blank"
        end 
        it "phone_numberが空だと登録できない" do
          @order.phone_number = ""
          @order.valid?
          expect(@order.errors.full_messages).to include "Phone number can't be blank", "Phone number Phone number input only number"
        end 
        it "郵便番号にはハイフンがないと登録できない" do
          @order.zip_code = "1234567"
          @order.valid?
          expect(@order.errors.full_messages).to include "Zip code Zip code input correctly"
        end 
        it "電話番号には電話番号にはハイフンは不要で、11桁以上であると登録できない" do
          @order.phone_number = "111-1111-11111"
          @order.valid?
          expect(@order.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)", "Phone number Phone number input only number"
        end 
        
     end
  end
end
