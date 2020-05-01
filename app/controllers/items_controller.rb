class ItemsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

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
  def show
    @item = Item.find(params[:id])
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

  def record_not_found
    render file: 'public/404.html', #連入檔案
    status: 404, #給瀏覽器看的狀態
    layout: false #不要使用公共layout
  end
end
