class SellItemsController < ApplicationController

  def index
    @buy_item = BuyItem.find(params[:buy_item_id])
  end

  def create
  end

end
