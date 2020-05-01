class ItemsController < ApplicationController
before_action :find_item, only: [:show, :edit, :update, :destroy]

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
    
  end
  def edit
    
  end
  def update
    
    if @item.update(item_params)
      redirect_to items_path, notice: "餐點更新成功！"
    else
      render :edit
    end

  end
  def destroy
    @item.destroy
    redirect_to items_path, notice: "餐點已刪除！"
  end

  private
  def item_params
    params.require(:item).permit(:name,
                                 :price,
                                 :description,
                                 :spec)
  end
  def find_item
    @item = Item.find(params[:id])
  end

end
