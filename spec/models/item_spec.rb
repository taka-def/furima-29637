require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.user
   end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
        it"全ての情報が正しく入力されている" do
          expect(@item).to be_valid
        end
     end

     context '商品登録がうまくいかないとき' do
      it "画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "商品名が空だと登録できない" do
        @item.products_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Products name can't be blank"
      end
      it "説明が空だと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it "カテゴリーが空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "カテゴリーが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "商品の状態が空だと登録できない" do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it "商品の状態が1だと登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it "配送料の負担が空だと登録できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it "配送料の負担が1だと登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it "発送元の地域が空だと登録できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it "発送元の地域が1だと登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it "発送までの日数が空だと登録できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it "発送までの日数が1だと登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it "価格が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "価格が全角文字だと登録できない" do
        @item.price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it "価格が半角英数字混合だと登録できない" do
        @item.price = "444a"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it "価格が半角英字のみだと登録できない" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it "価格が300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it "価格が10000000だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
    end
  end
end