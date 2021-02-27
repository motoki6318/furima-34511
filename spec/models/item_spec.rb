require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品投稿機能' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
    end
    context '商品を出品できる時' do
      it '全ての値が正しく入力できていれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない時' do
      it 'ユーザーに紐づかないと保存できないこと' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
      it '画像が空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品の説明が空だと保存できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報がないと保存できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it '商品状態の情報がないと保存できないこと' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '配送の負担についての情報がないと保存できないこと' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage Select")
      end
      it '発送元地域についての情報がないと保存できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it '発送までの日数についての情報がないと保存できないこと' do
        @item.delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery Select")
      end
      it '価格についての情報がないと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price Out of setting range", "Price Half-width number")
      end
      it '販売価格が300より少ないと保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '販売価格が9999999を超えると保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '販売価格を全角で入力すると保存できないこと' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range", "Price Half-width number")
      end
    end
  end
end
