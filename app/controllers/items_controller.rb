class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :purchase, :edit, :destroy, :update]
  before_action :set_all_items, only: [:index, :saled, :bought]

  def index
    @items = @items.where(release: "全体公開")
  end

  def saled
    @items = @items.where(saler_id: current_user.id)
  end

  def bought
    @items = @items.where(buyer_id: current_user.id)
  end

  def show
    @user = User.find(@item.saler_id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(name: item_params[:name], image: item_params[:image], description: item_params[:description], category: item_params[:category], state: item_params[:state], postage: item_params[:postage], region: item_params[:region], shipping_date: item_params[:shipping_date], price: item_params[:price], release: item_params[:release], saler_id: current_user.id)
    if @item.save
      redirect_to "/items", notice: "商品を投稿しました"
    else
      flash.now[:alert] = "必須項目が入力されているかもう一度確認してください。"
      render 'new'
    end
  end

  def purchase
    Payjp.api_key = Rails.application.secrets.payjp_secret_key
    Payjp::Charge.create(
      :amount => @item.price,
      :card => params['payjp-token'],
      :currency => 'jpy'
    )
    @item.buyer_id = current_user.id
    @item.save
  end

  def destroy
    @item.destroy if @item.saler_id == current_user.id
  end

  def edit
  end

  def update
    # image_url = Item.friendly.find(params[:id]).image.url
    # params.require(:item)["image"] = image_url

    if @item.saler_id == current_user.id
      @item.update(name: item_params[:name], image: item_params[:image], description: item_params[:description], category: item_params[:category], state: item_params[:state], postage: item_params[:postage], region: item_params[:region], shipping_date: item_params[:shipping_date], price: item_params[:price], release: item_params[:release], saler_id: current_user.id)
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category, :state, :postage, :region, :shipping_date, :price, :release)
  end

  def set_item
    @item = Item.friendly.find(params[:id])
  end

  def set_all_items
    @items = Item.all.order("created_at DESC")
  end

end
