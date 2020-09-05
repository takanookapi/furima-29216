class SellItemsController < ApplicationController
  before_action :nobuy_move_to_index
  before_action :nobuy_seller_purchased_move_to_index

  def index
    @buy_item = BuyItem.find(params[:buy_item_id])
    @sell_item = SellitemAddress.new
  end

  def create
    @sell_item = SellitemAddress.new(sell_item_params)
    @buy_item = BuyItem.find(params[:buy_item_id])
    if @sell_item.valid?
      pay_item
      @sell_item.save
      return redirect_to root_path
    else
      render 'sell_items/index'
    end
  end

  def pay_item
    @buy_item = BuyItem.find(params[:buy_item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @buy_item.price,
      card: sell_item_params[:token],    
      currency:'jpy'                 
    )
  end 

  def nobuy_seller_purchased_move_to_index
    @buy_item = BuyItem.find(params[:buy_item_id])
    if user_signed_in? && current_user.id == @buy_item.user_id
        redirect_to root_path
    end
  end

  private

  def sell_item_params
    params.require(:sellitem_address).permit(:postal_code, :shipping_orig_id, :city, :address_other, :building_name, :telephone_num, :user_id,:token).merge(user_id: current_user.id).merge(buy_item_id: params[:buy_item_id])
  end

  def nobuy_move_to_index
    redirect_to root_path unless user_signed_in?
  end

end