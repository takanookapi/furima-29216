class BuyItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @buy_items = BuyItem.order('created_at DESC')
  end

  def new
    @buy_item = BuyItem.new
  end

  def show
    @buy_item = BuyItem.find(params[:id])
  end

  def update
    @buy_item = BuyItem.find(params[:id])
    if @buy_item.update(buy_item_params)
      render :show
    else
      render :edit
    end
  end

  def create
    @buy_item = BuyItem.new(buy_item_params)
    if @buy_item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @buy_item = BuyItem.find(params[:id])
    redirect_to root_path unless current_user.id == @buy_item.user_id
  end

  private

  def buy_item_params
    params.require(:buy_item).permit(:title, :content, :category_id, :item_status_id, :shipping_day_id, :shipping_fee_id, :shipping_orig_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
