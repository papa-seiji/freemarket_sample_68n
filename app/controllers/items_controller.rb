class ItemsController < ApplicationController
  def index
    @sales = Item.where(sold_out: 0)
    @sold_outs= Item.where(sold_out: 1)
  end
  # @sales発売中のitemを配列に代入
  # @sold_outs売り切れのitemを配列に代入
  
  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    # item transact: :environment do
      ActiveRecord::Base.transaction do
        if @item.save!
          redirect_to items_path
        else
          render :new
        end
      end
    # end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  # user_id,category_idは機能未実装のため仮の値をセットしている。
  def item_params
    params.require(:item).permit(:name, :price, :item_text, :address, :date, :brand, :status, :delivery_charge, :size, images_attributes: [:image]).merge(user_id: 1, sold_out: 0,category_id: 1)
  end
end
