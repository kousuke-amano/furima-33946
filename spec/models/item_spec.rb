require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品機能' do
    context '出品ができる' do
      it 'image、name、description 、category、state、burden、area、scheduleddate、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない' do
      it 'imageを1枚つけないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'categoryに1が選択されている場合は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it 'stateに1が選択されている場合は登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'State Select'
      end
      it 'burdenに1が選択されている場合は登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Burden Select'
      end
      it 'areaに1が選択されている場合は登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area Select'
      end
      it 'scheduleddateに1が選択されている場合は登録できない' do
        @item.scheduled_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Scheduled date Select'
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが299円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceが10000000円以上では登録できない' do
        @item.price = '10000000'

        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
    end
  end
end
