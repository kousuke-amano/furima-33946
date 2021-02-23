require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 1
    @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
  end
  describe '購入機能' do
    context '購入ができる' do
      it 'token、postal_code、area_id、municipality、adress、phone_numberが存在すれば購入できる' do
        expect(@buyer_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @buyer_address.building = ''
      end
    end
    context '購入ができない' do
      it 'tokenが空では購入できない' do
        @buyer_address.token = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空では購入できない' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeに半角ハイフンが無い場合は購入できない' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'area_idが空では購入できない' do
        @buyer_address.area_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Area can't be blank"
      end
      it 'area_idがid(1)が選択されている場合は購入できない' do
        @buyer_address.area_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Area must be other than 1"
      end
      it 'municipalityが空では購入できない' do
        @buyer_address.municipality = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'addressが空では購入できない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では購入できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが11桁以内でないと購入できない' do
        @buyer_address.phone_number = '080123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Phone number is too long (maximum is 11 characters)'
      end
      it 'phone_numberがハイフンが存在する場合は購入できない' do
        @buyer_address.phone_number = '08012-34567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Phone number is not a number'
      end
      it 'phone_numberが全角数字では購入できない' do
        @buyer_address.phone_number = '０８０１２３４５６７８'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Phone number is not a number'
      end
      it 'user_idが空では購入できない' do
        @buyer_address.user_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では購入できない' do
        @buyer_address.item_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
