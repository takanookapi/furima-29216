class BuyItemsController < ApplicationController

  def index
    @buy_items = BuyItem.all
  end

  def new
    @buy_item = BuyItem.new
  end
end

