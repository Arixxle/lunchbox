class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: '餐點新增成功！'
    else
     render :new
    end
  end
  def destroy
    item = Item.find(params[:id]) #這個params[:id]會從網址抓到該item的id
    item.destroy
    redirect_to items_path, notice: "餐點已刪除！"
  end

  private
  def item_params
    params.require(:item).permit(:name,
                                 :price,
                                 :description,
                                 :spec)
  end
end
