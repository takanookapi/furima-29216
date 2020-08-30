class BuyItemsController < ApplicationController

  def index
    @buy_items = BuyItem.all
  end

  def new
    @buy_items = BuyItem.new
  end

  def new
    @buy_items = BuyItem.new
  end
end

