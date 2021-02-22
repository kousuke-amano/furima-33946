class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user || !@item.buyer.nil?
    @buyer = BuyerAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer = BuyerAddress.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :area_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = 'sk_test_ed8d25d904d853c45caec7f1'
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end
