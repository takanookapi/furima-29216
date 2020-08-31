class BuyItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @buy_items = BuyItem.all
  end

  def new
    @buy_item = BuyItem.new
  end

  def create
    @buy_item = BuyItem.new(buy_item_params)
    if @buy_item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private
  def buy_item_params
      params.require(:buy_item).permit(:title, :content, :category_id, :item_status_id, :shipping_days_id, :shipping_fee_id, :shipping_orig_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end

