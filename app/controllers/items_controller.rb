class ItemsController < ApplicationController

  def index
    # 商品一覧を表示
  end

  def show
    # 商品詳細を表示
  end

  def new
    @item = Item.new
  end

  def create
  end

end
