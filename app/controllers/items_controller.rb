class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :purchase]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @user = User.find(@item.saler_id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(name: item_params[:name], image: item_params[:image], description: item_params[:description], category: item_params[:category], state: item_params[:state], postage: item_params[:postage], region: item_params[:region], shipping_date: item_params[:shipping_date], price: item_params[:price], saler_id: current_user.id)
    if @item.save
      redirect_to "/items", notice: "商品を投稿しました"
    else
      flash.now[:alert] = "必須項目を入力してください。"
      render 'new'
    end
  end

  def purchase
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(
      :amount => @item.price,
      :card => params['payjp-token'],
      :currency => 'jpy'
    )
    @item.buyer_id = current_user.id
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category, :state, :postage, :region, :shipping_date, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
